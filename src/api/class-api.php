<?php

namespace BH_AWP_Add_Affiliates_to_Klaviyo\api;

use Affiliate_WP;
use AffWP\Affiliate;
use BH_AWP_Add_Affiliates_to_Klaviyo\Klaviyo\Exception\KlaviyoException;
use BH_AWP_Add_Affiliates_to_Klaviyo\Klaviyo\Klaviyo;
use BH_AWP_Add_Affiliates_to_Klaviyo\Klaviyo\Lists;
use BH_AWP_Add_Affiliates_to_Klaviyo\Klaviyo\Model\ProfileModel;
use BH_AWP_Add_Affiliates_to_Klaviyo\Psr\Log\LoggerInterface;

class API implements API_Interface {

	/** @var ?Klaviyo */
	protected $klaviyo_client;

	/** @var Settings_Interface $settings */
	protected $settings;

	/** @var LoggerInterface */
	protected $logger;

	public function __construct( $klaviyo_client, $settings, $logger ) {

		$this->klaviyo_client = $klaviyo_client;
		$this->settings       = $settings;
		$this->logger         = $logger;
	}

	/**
	 * TODO: This should be in settings?
	 *
	 * @return bool
	 */
	public function is_configured(): bool {
		return ! is_null( $this->klaviyo_client ) && ! empty( $this->settings->get_klaviyo_affiliate_list_ids() );
	}

	/**
	 * For CLI, cron, and after saving settings.
	 *
	 * Fetches all registered affiliates, sorted status.
	 * Adds each to the appropriate Klaviyo list and removes from the other lists.
	 */
	public function update_all_klaviyo_affiliate_lists( $manual = false ): array {

		$changes = array();

		if ( ! $this->is_configured() ) {
			$this->logger->debug( 'Klaviyo client null.' );
			return $changes;
		}

		$already_running = get_transient( 'bh-awp-add-affiliiates-to-klaviyo-running' );
		if ( ! empty( $already_running ) && false == $manual ) {
			return array( 'message' => 'Already running: ' . $already_running );
		}

		set_transient( 'bh-awp-add-affiliiates-to-klaviyo-running', time(), 5 * MINUTE_IN_SECONDS );

		$this->logger->debug( 'Updating all Klaviyo affiliate lists' );

		$affiliate_ap = Affiliate_WP::instance();

		$paging = 100;

		$affiliates_query           = array();
		$affiliates_query['number'] = $paging;
		// 'fields'       => '', TODO: email, status

		// Get all affiliates by status.
		$affiliates = array();
		foreach ( array_keys( affwp_get_affiliate_statuses() ) as $affiliate_status ) {
			$affiliates_query['offset'] = 0;
			$affiliates_query['status'] = $affiliate_status;

			$affiliates[ $affiliate_status ] = array();
			do {
				$page_of_affiliates              = $affiliate_ap->affiliates->get_affiliates( $affiliates_query );
				$affiliates[ $affiliate_status ] = array_merge( $page_of_affiliates, $affiliates[ $affiliate_status ] );
				$affiliates_query['offset']      = intval( $affiliates_query['offset'] ) + $paging;
			} while ( count( $page_of_affiliates ) === $paging );
		}

		$affiliate_profiles_by_status = array();
		$affiliate_emails_by_status   = array();

		/**
		 * @param Affiliate $affiliate
		 *
		 * @return string
		 */
		$get_email_from_affiliate = function( $affiliate ) {
			/** @var \WP_User $wp_user */
			$wp_user = $affiliate->get_user();
			return $wp_user->user_email;
		};

		foreach ( array_keys( affwp_get_affiliate_statuses() ) as $status ) {
			$affiliate_profiles_by_status[ $status ] = array_map( array( $this, 'get_klaviyo_array' ), $affiliates[ $status ] );
			$affiliate_emails_by_status[ $status ]   = array_map( $get_email_from_affiliate, $affiliates[ $status ] );
		}

		// Add the affiliate profile to where it should be.
		// Remove the affiliate by email where it's not needed.
		$list_ids = $this->settings->get_klaviyo_affiliate_list_ids();

		/** @var Lists */
		$klaviyo_client_lists = $this->klaviyo_client->lists;

		$klaviyo_client_lists = new Lists( $this->settings->get_klaviyo_public_api_key(), $this->settings->get_klaviyo_private_api_key() );

		// Determine changes to make.

		foreach ( $list_ids as $status => $list_id ) {

			$changes[ $list_id ] = array(
				'add'    => array(),
				'remove' => array(),
			);

			$existing_list_members = array();

			// Check who is already in the list.
			try {

				$email_addresses_arrays = array_chunk( $affiliate_emails_by_status[ $status ], 99 );

				foreach ( $email_addresses_arrays as $email_addresses ) {
					$this->logger->debug( 'Checking emails ' . count( $email_addresses ) . ' against list ' . $list_id );

					// Limit of 100 emails per request.
					$response = $klaviyo_client_lists->checkListMembership( $list_id, $email_addresses );

					$this->logger->debug( 'Found emails ' . count( $response ) . ' emails already present in list ' . $list_id );

					$existing_list_members = array_merge( $response, $existing_list_members );
				}
			} catch ( KlaviyoException $e ) {
				$this->logger->error( 'KlaviyoException ' . $e->getCode() . ': ' . $e->getMessage(), array( 'KlaviyoException' => $e ) );
				return array();
			}
			/** @var array $existing_list_members_emails array of arrays for each user, as returned from Klaviyo  */
			$existing_list_members_emails = array_map(
				function( $element ) {
					if ( isset( $element['email'] ) ) {
						return $element['email'];
					} else {
						$this->logger->debug( 'email not present in element', array( 'element' => $element ) );
						return null;
					}
				},
				$existing_list_members
			);

			/** @var ProfileModel $element  */
			$check_for_profilemodel = function( $element ) use ( $existing_list_members_emails ) {
				return ! in_array( $element->email, $existing_list_members_emails, true );
			};

			$new_members_to_add = array_filter( $affiliate_profiles_by_status[ $status ], $check_for_profilemodel );

			$this->logger->debug( 'Found ' . count( $new_members_to_add ) . ' to add to list ' . $list_id );

			$changes[ $list_id ]['add'] = $new_members_to_add;

			$emails_not_for_this_list = array();
			foreach ( $affiliate_emails_by_status as $email_lists_status => $emails ) {
				if ( $email_lists_status === $status ) {
					continue;
				}
				$emails_not_for_this_list = array_merge( $emails_not_for_this_list, $emails );
			}

			$members_to_remove_emails = array();

			foreach ( array_chunk( $emails_not_for_this_list, 99 ) as $emails ) {
				$members_to_remove = $klaviyo_client_lists->checkListMembership( $list_id, $emails );

				$members_to_remove_emails[] = array_map(
					function ( $element ) {
						return $element['email'];
					},
					$members_to_remove
				);
			}

			$this->logger->debug( 'Found ' . count( $members_to_remove_emails ) . ' to remove from list ' . $list_id );

			$changes[ $list_id ]['remove'] = $members_to_remove_emails;
		}

		foreach ( $changes as $list_id => $update ) {

			// Adds members to list without affecting consent status.
			if ( 'production' === wp_get_environment_type() ) {
				try {
					foreach ( array_chunk( $changes[ $list_id ]['add'], 99 ) as $affiliate_batch ) {
						$klaviyo_client_lists->addMembersToList( $list_id, $affiliate_batch );
					}
				} catch ( KlaviyoException $e ) {
					$this->logger->error( $e->getMessage(), array( 'trace' => $e->getTrace() ) );
				}
			} else {
				$this->logger->notice( 'Not running on production site. No changes pushed to Klaviyo' );
			}

			$this->logger->info( 'Added ' . count( $update['add'] ) . ' members to list ' . $list_id, array( 'new_members' => $update['add'] ) );

			if ( 'production' === wp_get_environment_type() ) {
				foreach ( array_chunk( $changes[ $list_id ]['remove'], 99 ) as $affiliate_batch ) {
					$klaviyo_client_lists->removeMembersFromList( $list_id, $affiliate_batch );
				}
			}

			$this->logger->info( 'Removed ' . count( $update['remove'] ) . ' members from list ' . $list_id, array( 'removed_members' => $update['remove'] ) );

		}

		delete_transient( 'bh-awp-add-affiliiates-to-klaviyo-running' );

		return $changes;
	}

	/**
	 * @param Affiliate $affiliate
	 */
	public function update_klaviyo_affiliate_lists_for_single_affiliate( $affiliate ): void {

		$klaviyo_affiliate_data = $this->get_klaviyo_array( $affiliate );

		$list_ids = $this->settings->get_klaviyo_affiliate_list_ids();

		/** @var Lists */
		$klaviyo_client_lists = $this->klaviyo_client->lists;

		foreach ( $list_ids as $status => $list_id ) {
			if ( 'production' === wp_get_environment_type() ) {
				if ( $affiliate->status === $status ) {
					// Adds members to list without affecting consent status.
					$klaviyo_client_lists->addMembersToList( $list_id, array( $klaviyo_affiliate_data ) );
				} else {
					$klaviyo_client_lists->removeMembersFromList( $list_id, array( $klaviyo_affiliate_data['email'] ) );

				}
			} else {
				$this->logger->notice( 'Not running on production site. No changes pushed to Klaviyo' );
			}
		}
	}


	/**
	 * Function to convert from AffiliateWP object to Klaviyo array data structure.
	 *
	 * @param Affiliate $affiliate
	 *
	 * @return ProfileModel
	 */
	public function get_klaviyo_array( $affiliate ): ProfileModel {

		/** @var \WP_User $wp_user */
		$wp_user = $affiliate->get_user();

		return new ProfileModel(
			array(
				'$email'       => $wp_user->user_email,
				'AffiliateId'  => $affiliate->affiliate_id,
				'PaymentEmail' => $affiliate->payment_email,
				'WPUserID'     => $wp_user->ID,
			)
		);
	}

}

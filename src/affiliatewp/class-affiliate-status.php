<?php
/**
 * Subscribes the affiliates to Klaviyo lists when their status changes.
 *
 * @link       http://example.com
 * @since      1.0.0
 *
 * @package    BH_AWP_Add_Affiliates_to_Klaviyo
 * @subpackage BH_AWP_Add_Affiliates_to_Klaviyo/affiliatewp
 */

namespace BH_AWP_Add_Affiliates_to_Klaviyo\affiliatewp;

use BH_AWP_Add_Affiliates_to_Klaviyo\api\Settings;
use BH_AWP_Add_Affiliates_to_Klaviyo\Logger;
use BH_AWP_Add_Affiliates_to_Klaviyo\WPPB\WPPB_Object;

/**
 * Takes an updated affiliate's status and updates the Klaviyo lists they should and should not be subscribed to.
 *
 * @package    BH_AWP_Add_Affiliates_to_Klaviyo
 * @subpackage BH_AWP_Add_Affiliates_to_Klaviyo/affiliatewp
 * @author     Brian Henry <BrianHenryIE@gmail.com>
 */
class Affiliate_Status extends WPPB_Object {

	/**
	 * The Klaviyo API key and list ids.
	 *
	 * @var Settings
	 */
	protected $settings;

	/**
	 * Affiliate_Status constructor.
	 *
	 * @param Settings $settings The plugin settings.
	 * @param string   $plugin_name The plugin name.
	 * @param string   $version The plugin version.
	 */
	public function __construct( $settings, $plugin_name, $version ) {
		parent::__construct( $plugin_name, $version );
		$this->settings = $settings;
	}

	/**
	 * When the affiliate's status is set (presumably changed), subscribe and unsubscribe them to the appropriate
	 * Klaviyo lists.
	 *
	 * @hooked affwp_set_affiliate_status
	 *
	 * @see affwp_set_affiliate_status()
	 * @see https://www.klaviyo.com/docs/api/v2/lists#post-subscribe
	 *
	 * @param int    $affiliate_id            The AffiliateWP identifier.
	 * @param string $affiliate_status        One of 'active'|'inactive'|'pending'|rejected'.
	 * @param string $old_affiliate_status    One of 'active'|'inactive'|'pending'|rejected'.
	 */
	public function add_affiliate_to_klaviyo( $affiliate_id = 0, $affiliate_status = '', $old_affiliate_status = '' ) {

		// TODO: Is it possible for old and new status to be equal?

		$affiliate_email         = affwp_get_affiliate_email( $affiliate_id );
		$affiliate_wp_user_id    = affwp_get_affiliate_username( $affiliate_id );
		$affiliate_payment_email = affwp_get_affiliate_payment_email( $affiliate_id );

		Logger::get_instance()->debug( "Affiliate $affiliate_id $affiliate_wp_user_id status set to $affiliate_status." );

		$api_key = $this->settings->get_klaviyo_private_api_key();

		$statuses_to_list_ids = $this->settings->get_klaviyo_list_ids();

		foreach ( $statuses_to_list_ids as $list_name => $list_id ) {

			if ( empty( $list_id ) ) {
				continue;
			}

			// Subscribe the affiliate to that list.
			if ( $list_name === $affiliate_status ) {

				Logger::get_instance()->info( "Adding affiliate $affiliate_id $affiliate_email to `$list_name` Klaviyo list $list_id." );

				$request_url  = "https://a.klaviyo.com/api/v2/list/$list_id/subscribe";
				$request_body = wp_json_encode(
					array(
						'api_key'  => $api_key,
						'profiles' => array(
							array(
								'email'        => $affiliate_email,
								'AffiliateId'  => $affiliate_id,
								'PaymentEmail' => $affiliate_payment_email,
								'WPUserID'     => $affiliate_wp_user_id,
							),
						),
					)
				);

				$result = wp_remote_post(
					$request_url,
					array(
						'headers' => array(
							'Content-Type' => 'application/json',
						),
						'body'    => $request_body,
					)
				);

				if ( is_wp_error( $result ) ) {

					Logger::get_instance()->error( 'Klaviyo remote request failed', array( 'WP_Error' => $result ) );

				} elseif ( 2 !== intval( intval( $result['response']['code'] ) / 100 ) ) {

					// Not a HTTP 200 response.
					Logger::get_instance()->error(
						"Error adding affiliate $affiliate_id $affiliate_email to `$list_name` Klaviyo list $list_id.",
						array(
							'request'  => array(
								'url'  => $request_url,
								'body' => $request_body,
							),
							'response' => array(
								'headers'  => $result['headers'],
								'body'     => $result['body'],
								'response' => $result['response'],
							),
						)
					);

				} else {

					Logger::get_instance()->info( "Successfully added affiliate $affiliate_id $affiliate_email to $list_name Klaviyo list $list_id." );

				}

				continue;
			}

			// Remove the affiliate from the old list.
			if ( $list_name === $old_affiliate_status ) {

				Logger::get_instance()->info( "Deleting affiliate $affiliate_id $affiliate_wp_user_id to `$list_name` Klaviyo list $list_id." );

				$request_url  = "https://a.klaviyo.com/api/v2/list/$list_id/subscribe";
				$request_body = wp_json_encode(
					array(
						'api_key' => $api_key,
						'emails'  => array( $affiliate_email ),
					)
				);

				$result = wp_remote_request(
					$request_url,
					array(
						'method'  => 'DELETE',
						'headers' => array(
							'Content-Type' => 'application/json',
						),
						'body'    => $request_body,
					)
				);

				if ( is_wp_error( $result ) ) {

					Logger::get_instance()->error( 'Klaviyo remote request failed', array( 'WP_Error' => $result ) );

				} elseif ( 2 !== intval( intval( $result['response']['code'] ) / 100 ) ) {

					// Not a HTTP 200 response.
					Logger::get_instance()->error(
						"Error deleting affiliate $affiliate_id $affiliate_email from `$list_name` Klaviyo list $list_id.",
						array(
							'request'  => array(
								'url'  => $request_url,
								'body' => $request_body,
							),
							'response' => array(
								'headers'  => $result['headers'],
								'body'     => $result['body'],
								'response' => $result['response'],
							),
						)
					);

				} else {

					Logger::get_instance()->info( "Successfully deleted affiliate $affiliate_id $affiliate_email from `$list_name` Klaviyo list $list_id." );

				}

				continue;
			}
		}

	}

}

<?php

namespace BH_AWP_Add_Affiliates_to_Klaviyo\includes;

use BH_AWP_Add_Affiliates_to_Klaviyo\api\API_Interface;
use BH_AWP_Add_Affiliates_to_Klaviyo\Psr\Log\LoggerInterface;

class Cron {

	/**
	 * @var API_Interface $api
	 */
	protected $api;

	/** @var LoggerInterface */
	protected $logger;

	public function __construct( $api, $logger ) {

		$this->api    = $api;
		$this->logger = $logger;
	}

	/**
	 * Schedule a weekly cron job.
	 *
	 * @hooked init
	 */
	public function register_cron_job() {

		$cron_hook = API_Interface::UPDATE_ALL_KLAVIYO_AFFILIATE_LISTS_CRON_HOOK;

		if ( false !== wp_get_scheduled_event( $cron_hook ) ) {
			// Already scheduled.
			return;
		}

		if ( ! $this->api->is_configured() ) {
			return;
		}

		$this->logger->info( 'Weekly cron job scheduled to update affiliates in Klaviyo' );

		wp_schedule_event( strtotime( 'tomorrow' ), 'weekly', $cron_hook );
	}

	/**
	 *
	 * @see API_Interface::UPDATE_ALL_KLAVIYO_AFFILIATE_LISTS_CRON_HOOK
	 */
	public function update_all_klaviyo_affiliate_lists() {

		$this->logger->debug( __FUNCTION__ . ' invoked from cron' );

		$manual = false;
		$this->api->update_all_klaviyo_affiliate_lists( $manual );
	}

}

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

use AffWP\Affiliate;
use BH_AWP_Add_Affiliates_to_Klaviyo\api\API_Interface;
use BH_AWP_Add_Affiliates_to_Klaviyo\api\Settings;
use BH_AWP_Add_Affiliates_to_Klaviyo\api\Settings_Interface;
use BH_AWP_Add_Affiliates_to_Klaviyo\Psr\Log\LoggerInterface;


/**
 * Takes an updated affiliate's status and updates the Klaviyo lists they should and should not be subscribed to.
 *
 * @package    BH_AWP_Add_Affiliates_to_Klaviyo
 * @subpackage BH_AWP_Add_Affiliates_to_Klaviyo/affiliatewp
 * @author     Brian Henry <BrianHenryIE@gmail.com>
 */
class Affiliate_Status {

	/** @var API_Interface */
	protected $api;

	/**
	 * The Klaviyo API key and list ids.
	 *
	 * @var Settings_Interface
	 */
	protected $settings;

	/** @var LoggerInterface $logger */
	protected $logger;

	/**
	 * Affiliate_Status constructor.
	 *
	 * @param API_Interface   $api
	 * @param Settings        $settings The plugin settings.
	 * @param LoggerInterface $logger
	 */
	public function __construct( $api, $settings, $logger ) {
		$this->logger   = $logger;
		$this->settings = $settings;
		$this->api      = $api;
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
	public function add_affiliate_to_klaviyo( $affiliate_id, $affiliate_status, $old_affiliate_status ) {

		/** @var Affiliate $affiliate */
		$affiliate = affwp_get_affiliate( $affiliate_id );

		$this->logger->debug( "Affiliate {$affiliate->payment_email()} status updated to {$affiliate_status} from {$old_affiliate_status}" );

		$this->api->update_klaviyo_affiliate_lists_for_single_affiliate( $affiliate );

	}

}

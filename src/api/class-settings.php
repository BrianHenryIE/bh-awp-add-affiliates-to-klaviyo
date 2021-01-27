<?php
/**
 * Settings are stored as part of AffiliateWP's settings but made accessible through this object.
 *
 * @link       http://example.com
 * @since      1.0.0
 *
 * @package    BH_AWP_Add_Affiliates_to_Klaviyo
 * @subpackage BH_AWP_Add_Affiliates_to_Klaviyo/api
 */

namespace BH_AWP_Add_Affiliates_to_Klaviyo\api;

use BH_AWP_Add_Affiliates_to_Klaviyo\BrianHenryIE\WP_Logger\api\Logger_Settings_Interface;
use BH_AWP_Add_Affiliates_to_Klaviyo\Psr\Log\LogLevel;

/**
 * Getters to provide an OO interface for the settings saved on the AffiliateWP setting tab "Klaviyo".
 *
 * Class Settings
 *
 * @package BH_AWP_Add_Affiliates_to_Klaviyo\api
 */
class Settings implements Settings_Interface, Logger_Settings_Interface {

	/**
	 * The Klaviyo API key.
	 *
	 * "You can manage your private API keys from your account."
	 *
	 * @see https://www.klaviyo.com/account
	 *
	 * @return string
	 */
	public function get_klaviyo_private_api_key(): ?string {

		$affiliate_wp_settings = get_option( 'affwp_settings', array() );

		if ( array_key_exists( 'klaviyo_private_api_key', $affiliate_wp_settings ) ) {
			return $affiliate_wp_settings['klaviyo_private_api_key'];
		}

		return null;
	}

	public function get_klaviyo_public_api_key(): ?string {

		$affiliate_wp_settings = get_option( 'affwp_settings', array() );

		if ( array_key_exists( 'klaviyo_public_api_key', $affiliate_wp_settings ) ) {
			return $affiliate_wp_settings['klaviyo_public_api_key'];
		}

		return null;
	}

	/**
	 * Get the Klaviyo list ids affiliates should be added to.
	 *
	 * @return string[] 'rejected'|'pending'|'active'|'inactive' => Klaviyo list ids.
	 */
	public function get_klaviyo_affiliate_list_ids(): array {

		$list_ids = array();

		$affiliate_wp_settings = get_option( 'affwp_settings', array() );

		$list_statuses = array(
			'active',
			'inactive',
			'pending',
			'rejected',
		);

		foreach ( $list_statuses as $status ) {

			if ( !empty( $affiliate_wp_settings["klaviyo_{$status}_affiliates_list_id"] ) ) {
				$list_ids[ $status ] = $affiliate_wp_settings[ "klaviyo_{$status}_affiliates_list_id" ];
			}
		}

		return $list_ids;
	}


	public function get_plugin_slug(): string {
		return 'bh-awp-add-affiliates-to-klaviyo';
	}

	public function get_log_level(): string {
		return LogLevel::INFO;
	}

	/**
	 * For friendly display.
	 *
	 * @return string
	 */
	public function get_plugin_name(): string {
		return 'Add Affiliates to Klaviyo';
	}

	public function get_plugin_basename(): string {
		return 'bh-awp-add-affiliates-to-klaviyo/bh-awp-add-affiliates-to-klaviyo.php';
	}
}

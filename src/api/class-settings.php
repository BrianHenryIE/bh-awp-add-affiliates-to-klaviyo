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

/**
 * Getters to provide an OO interface for the settings saved on the AffiliateWP setting tab "Klaviyo".
 *
 * Class Settings
 *
 * @package BH_AWP_Add_Affiliates_to_Klaviyo\api
 */
class Settings {

	/**
	 * The Klaviyo API key.
	 *
	 * "You can manage your private API keys from your account."
	 *
	 * @see https://www.klaviyo.com/account
	 *
	 * @return string
	 */
	public function get_klaviyo_private_api_key(): string {

		$affiliate_wp_settings = get_option( 'affwp_settings', array() );

		if ( array_key_exists( 'klaviyo_private_api_key', $affiliate_wp_settings ) ) {
			return $affiliate_wp_settings['klaviyo_private_api_key'];
		}

		return '';
	}

	/**
	 * Get the Klaviyo list ids affiliates should be added to.
	 *
	 * @return string[] 'rejected'|'pending'|'active'|'inactive' => Klaviyo list ids.
	 */
	public function get_klaviyo_list_ids() {

		$list_ids = array();

		$affiliate_wp_settings = get_option( 'affwp_settings', array() );

		$list_statuses = array(
			'active',
			'inactive',
			'pending',
			'rejected',
		);

		foreach ( $list_statuses as $status ) {

			if ( array_key_exists( "klaviyo_{$status}_affiliates_list_id", $affiliate_wp_settings ) ) {
				$list_ids[ $status ] = $affiliate_wp_settings[ "klaviyo_{$status}_affiliates_list_id" ];
			}
		}

		return $list_ids;
	}

}

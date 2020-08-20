<?php
/**
 * The Affiliate WP settings tab for the plugin.
 *
 * @link       http://example.com
 * @since      1.0.0
 *
 * @package    BH_AWP_Add_Affiliates_to_Klaviyo
 * @subpackage BH_AWP_Add_Affiliates_to_Klaviyo/affiliatewp
 */

namespace BH_AWP_Add_Affiliates_to_Klaviyo\affiliatewp;

use BH_AWP_Add_Affiliates_to_Klaviyo\WPPB\WPPB_Object;

/**
 * Registers the settings tab and the individual settings with AffiliateWP
 *
 * @package    BH_AWP_Add_Affiliates_to_Klaviyo
 * @subpackage BH_AWP_Add_Affiliates_to_Klaviyo/affiliatewp
 * @author     Brian Henry <BrianHenryIE@gmail.com>
 */
class Settings_Tab extends WPPB_Object {

	/**
	 * Register the Klaviyo settings tab with AffiliateWP.
	 *
	 * @see /wp-admin/admin.php?page=affiliate-wp-settings
	 *
	 * @see affwp_get_settings_tabs()
	 * @hooked affwp_settings_tabs
	 *
	 * @param array $tabs reference names and printable names for each tab in AffiliateWP settings page.
	 *
	 * @return array
	 */
	public function register_tab( $tabs ) {

		$tabs['klaviyo'] = __( 'Klaviyo', 'bh-awp-add-affiliates-to-klaviyo' );

		return $tabs;
	}

	/**
	 * Register the settings to appear on the Klaviyo tab of the AffiliateWP setting page.
	 *
	 * @see /wp-admin/admin.php?page=affiliate-wp-settings&tab=klaviyo
	 *
	 * @hooked affwp_settings
	 *
	 * @see Affiliate_WP_Settings::get_registered_settings()
	 * @see display-settings.php:38 ('affwp_settings_klaviyo')
	 *
	 * @param array $settings All AffiliateWP settings.
	 *
	 * @return array
	 */
	public function register_settings( $settings ) {

		$settings['klaviyo'] = array(
			'klaviyo_options_header'              => array(
				'name' => '<strong>' . __( 'Klaviyo Integration Options', 'bh-awp-add-affiliates-to-klaviyo' ) . '</strong>',
				'desc' => '',
				'type' => 'header',
			),
			'klaviyo_private_api_key'             => array(
				'name'              => __( 'Klaviyo Private API Key', 'bh-awp-add-affiliates-to-klaviyo' ),
				/* translators: %s: Klaviyo account URL. */
				'desc'              => sprintf( __( 'An API key for your Klaviyo account, found at  <a href="%s" target="_blank">klaviyo.com/account#api-keys-tab</a>.', 'bh-awp-add-affiliates-to-klaviyo' ), 'https://www.klaviyo.com/account#api-keys-tab' ),
				'type'              => 'text',
				'sanitize_callback' => 'sanitize_text_field',
			),
			'klaviyo_active_affiliates_list_id'   => array(
				'name' => __( 'Active Affiliates List ID', 'bh-awp-add-affiliates-to-klaviyo' ),
				'desc' => __( 'The Klaviyo list id to add <i>active</i> affiliate accounts to.', 'bh-awp-add-affiliates-to-klaviyo' ),
				'type' => 'text',
			),
			'klaviyo_inactive_affiliates_list_id' => array(
				'name' => __( 'Inactive Affiliates List ID', 'bh-awp-add-affiliates-to-klaviyo' ),
				'desc' => __( 'The Klaviyo list id to add <i>inactive</i> affiliate accounts to.', 'bh-awp-add-affiliates-to-klaviyo' ),
				'type' => 'text',
			),
			'klaviyo_pending_affiliates_list_id'  => array(
				'name' => __( 'Pending Affiliates List ID', 'bh-awp-add-affiliates-to-klaviyo' ),
				'desc' => __( 'The Klaviyo list id to add <i>pending</i> affiliate accounts to.', 'bh-awp-add-affiliates-to-klaviyo' ),
				'type' => 'text',
			),
			'klaviyo_rejected_affiliates_list_id' => array(
				'name' => __( 'Rejected Affiliates List ID', 'bh-awp-add-affiliates-to-klaviyo' ),
				'desc' => __( 'The Klaviyo list id to add <i>rejected</i> affiliate accounts to.', 'bh-awp-add-affiliates-to-klaviyo' ),
				'type' => 'text',
			),
		);

		// TODO: A button to process all existing affiliates.
		// TODO: Harder: verify the email addresses in each Klaviyo list are in the correct list.

		return $settings;

	}

}

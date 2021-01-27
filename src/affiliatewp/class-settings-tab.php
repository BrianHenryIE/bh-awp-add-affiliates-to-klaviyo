<?php
/**
 * The Affiliate WP settings tab for the plugin.
 *
 * TODO: On save, schedule a sync.
 * TODO: A button to process all existing affiliates.
 * TODO: Auto-complete the lists from existing lists.
 * TODO: Allow creating new lists.
 * TODO: Link to each list /wp-admin/admin.php?page=affiliate-wp-affiliates&status=active
 *
 * @link       http://example.com
 * @since      1.0.0
 *
 * @package    BH_AWP_Add_Affiliates_to_Klaviyo
 * @subpackage BH_AWP_Add_Affiliates_to_Klaviyo/affiliatewp
 */

namespace BH_AWP_Add_Affiliates_to_Klaviyo\affiliatewp;

/**
 * Registers the settings tab and the individual settings with AffiliateWP
 *
 * @package    BH_AWP_Add_Affiliates_to_Klaviyo
 * @subpackage BH_AWP_Add_Affiliates_to_Klaviyo/affiliatewp
 * @author     Brian Henry <BrianHenryIE@gmail.com>
 */
class Settings_Tab {

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

		// Try to get the public API key from the official Klaviyo plugin.
		$klaviyo_plugin_settings = get_option( 'klaviyo_settings', array() );
		$klaviyo_public_api_key = '';
		$klaviyo_private_api_key = '';
		if ( isset( $klaviyo_plugin_settings['public_api_key'] ) ) {
			$klaviyo_public_api_key = $klaviyo_plugin_settings['public_api_key'];
		}
		if ( isset( $klaviyo_plugin_settings['private_api_key'] ) ) {
			$klaviyo_private_api_key = $klaviyo_plugin_settings['private_api_key'];
		}

		$settings['klaviyo'] = array(
			'klaviyo_options_header'              => array(
				'name' => '<strong>' . __( 'Klaviyo Integration Options', 'bh-awp-add-affiliates-to-klaviyo' ) . '</strong>',
				'desc' => '',
				'type' => 'header',
			),
			'klaviyo_private_api_key'             => array(
				'name'              => __( 'Klaviyo Private API Key', 'bh-awp-add-affiliates-to-klaviyo' ),
				/* translators: %s: Klaviyo account URL. */
				'desc'              => sprintf( __( 'Find your API keys at  <a href="%s" target="_blank">klaviyo.com/account#api-keys-tab</a>.', 'bh-awp-add-affiliates-to-klaviyo' ), 'https://www.klaviyo.com/account#api-keys-tab' ),
				'type'              => 'text',
				'default'           => $klaviyo_private_api_key,
				'sanitize_callback' => 'sanitize_text_field',
			),
			'klaviyo_public_api_key'              => array(
				'name'              => __( 'Klaviyo Public API Key', 'bh-awp-add-affiliates-to-klaviyo' ),
				'default'           => $klaviyo_public_api_key,
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

		return $settings;

	}

}

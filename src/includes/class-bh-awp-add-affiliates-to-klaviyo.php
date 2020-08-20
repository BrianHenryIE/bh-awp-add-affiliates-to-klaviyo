<?php
/**
 * The file that defines the core plugin class
 *
 * A class definition that includes attributes and functions used across both the
 * frontend-facing side of the site and the admin area.
 *
 * @link       http://example.com
 * @since      1.0.0
 *
 * @package    BH_AWP_Add_Affiliates_to_Klaviyo
 * @subpackage BH_AWP_Add_Affiliates_to_Klaviyo/includes
 */

namespace BH_AWP_Add_Affiliates_to_Klaviyo\includes;

use BH_AWP_Add_Affiliates_to_Klaviyo\admin\Admin;
use BH_AWP_Add_Affiliates_to_Klaviyo\admin\Plugins_Page;
use BH_AWP_Add_Affiliates_to_Klaviyo\affiliatewp\Affiliate_Status;
use BH_AWP_Add_Affiliates_to_Klaviyo\affiliatewp\AffiliateWP;
use BH_AWP_Add_Affiliates_to_Klaviyo\affiliatewp\Settings_Tab;
use BH_AWP_Add_Affiliates_to_Klaviyo\api\Settings;
use BH_AWP_Add_Affiliates_to_Klaviyo\frontend\Frontend;
use BH_AWP_Add_Affiliates_to_Klaviyo\WPPB\WPPB_Loader_Interface;
use BH_AWP_Add_Affiliates_to_Klaviyo\WPPB\WPPB_Object;

/**
 * The core plugin class.
 *
 * This is used to define internationalization, admin-specific hooks, and
 * frontend-facing site hooks.
 *
 * Also maintains the unique identifier of this plugin as well as the current
 * version of the plugin.
 *
 * @since      1.0.0
 * @package    BH_AWP_Add_Affiliates_to_Klaviyo
 * @subpackage BH_AWP_Add_Affiliates_to_Klaviyo/includes
 * @author     Brian Henry <BrianHenryIE@gmail.com>
 */
class BH_AWP_Add_Affiliates_To_Klaviyo extends WPPB_Object {

	/**
	 * The loader that's responsible for maintaining and registering all hooks that power
	 * the plugin.
	 *
	 * @since    1.0.0
	 * @access   protected
	 * @var      WPPB_Loader_Interface    $loader    Maintains and registers all hooks for the plugin.
	 */
	protected $loader;

	/**
	 * Getters for the Klaviyo API key and list ids.
	 *
	 * @var Settings $settings The plugin settings,
	 */
	protected $settings;

	/**
	 * Define the core functionality of the plugin.
	 *
	 * Set the plugin name and the plugin version that can be used throughout the plugin.
	 * Load the dependencies, define the locale, and set the hooks for the admin area and
	 * the frontend-facing side of the site.
	 *
	 * @since    1.0.0
	 *
	 * @param Settings              $settings The plugin settings.
	 * @param WPPB_Loader_Interface $loader The WPPB class which adds the hooks and filters to WordPress.
	 */
	public function __construct( $settings, $loader ) {
		if ( defined( 'BH_AWP_ADD_AFFILIATES_TO_KLAVIYO_VERSION' ) ) {
			$this->version = BH_AWP_ADD_AFFILIATES_TO_KLAVIYO_VERSION;
		} else {
			$this->version = '1.0.0';
		}
		$this->plugin_name = 'bh-awp-add-affiliates-to-klaviyo';

		parent::__construct( $this->plugin_name, $this->version );

		$this->settings = $settings;
		$this->loader   = $loader;

		$this->set_locale();

		$this->define_admin_hooks();
		$this->define_affiliatewp_hooks();

	}

	/**
	 * Define the locale for this plugin for internationalization.
	 *
	 * Uses the i18n class in order to set the domain and to register the hook
	 * with WordPress.
	 *
	 * @since    1.0.0
	 * @access   private
	 */
	private function set_locale() {

		$this->i18n = $plugin_i18n = new I18n();

		$this->loader->add_action( 'plugins_loaded', $plugin_i18n, 'load_plugin_textdomain' );

	}


	/**
	 * Register all of the hooks related to the admin area functionality
	 * of the plugin.
	 *
	 * @since    1.0.0
	 * @access   private
	 */
	private function define_admin_hooks() {

		$plugins_page = new Plugins_Page( $this->get_plugin_name(), $this->get_version() );

		$plugin_basename = 'bh-awp-add-affiliates-to-klaviyo/bh-awp-add-affiliates-to-klaviyo.php';

		$this->loader->add_filter( 'plugin_action_links_' . $plugin_basename, $plugins_page, 'action_links' );
		$this->loader->add_filter( 'plugin_row_meta', $plugins_page, 'row_meta', 20, 4 );

	}

	/**
	 * Register all of the hooks related to the public-facing functionality
	 * of the plugin.
	 *
	 * @since    1.0.0
	 * @access   private
	 */
	private function define_affiliatewp_hooks() {

		$plugin_affiliate_status = new Affiliate_Status( $this->settings, $this->get_plugin_name(), $this->get_version() );

		$this->loader->add_action( 'affwp_set_affiliate_status', $plugin_affiliate_status, 'add_affiliate_to_klaviyo', 10, 3 );

		$plugin_affiliate_settings_tab = new Settings_Tab( $this->get_plugin_name(), $this->get_version() );

		$this->loader->add_filter( 'affwp_settings_tabs', $plugin_affiliate_settings_tab, 'register_tab' );
		$this->loader->add_filter( 'affwp_settings', $plugin_affiliate_settings_tab, 'register_settings' );

	}

	/**
	 * Run the loader to execute all of the hooks with WordPress.
	 *
	 * @since    1.0.0
	 */
	public function run() {
		$this->loader->run();
	}

	/**
	 * The reference to the class that orchestrates the hooks with the plugin.
	 *
	 * @since     1.0.0
	 * @return    WPPB_Loader_Interface    Orchestrates the hooks of the plugin.
	 */
	public function get_loader() {
		return $this->loader;
	}

}

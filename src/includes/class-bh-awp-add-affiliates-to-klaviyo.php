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

use BH_AWP_Add_Affiliates_to_Klaviyo\admin\Plugins_Page;
use BH_AWP_Add_Affiliates_to_Klaviyo\affiliatewp\Affiliate_Status;
use BH_AWP_Add_Affiliates_to_Klaviyo\affiliatewp\Settings_Tab;
use BH_AWP_Add_Affiliates_to_Klaviyo\api\API_Interface;
use BH_AWP_Add_Affiliates_to_Klaviyo\api\CLI;
use BH_AWP_Add_Affiliates_to_Klaviyo\api\Settings;
use BH_AWP_Add_Affiliates_to_Klaviyo\BrianHenryIE\WPPB\WPPB_Loader_Interface;
use BH_AWP_Add_Affiliates_to_Klaviyo\BrianHenryIE\WPPB\WPPB_Plugin_Abstract;
use BH_AWP_Add_Affiliates_to_Klaviyo\Psr\Log\LoggerInterface;
use WP_CLI;

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
class BH_AWP_Add_Affiliates_To_Klaviyo extends WPPB_Plugin_Abstract {

	/**
	 * Getters for the Klaviyo API key and list ids.
	 *
	 * @var Settings $settings The plugin settings,
	 */
	protected $settings;

	/** @var API_Interface */
	protected $api;

	/** @var LoggerInterface */
	protected $logger;


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
	public function __construct( $loader, $api, $settings, $logger ) {
		if ( defined( 'BH_AWP_ADD_AFFILIATES_TO_KLAVIYO_VERSION' ) ) {
			$version = BH_AWP_ADD_AFFILIATES_TO_KLAVIYO_VERSION;
		} else {
			$version = '2.0.1';
		}
		$plugin_name = 'bh-awp-add-affiliates-to-klaviyo';

		parent::__construct( $loader, $plugin_name, $version );

		$this->api      = $api;
		$this->settings = $settings;
		$this->logger   = $logger;

		$this->set_locale();

		$this->define_admin_hooks();
		$this->define_affiliatewp_hooks();
		$this->define_cron_hooks();
		$this->define_cli_commands();

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
	protected function set_locale() {

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
	protected function define_admin_hooks() {

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
	protected function define_affiliatewp_hooks() {

		$plugin_affiliate_status = new Affiliate_Status( $this->api, $this->settings, $this->logger );

		$this->loader->add_action( 'affwp_set_affiliate_status', $plugin_affiliate_status, 'add_affiliate_to_klaviyo', 10, 3 );

		$plugin_affiliate_settings_tab = new Settings_Tab();

		$this->loader->add_filter( 'affwp_settings_tabs', $plugin_affiliate_settings_tab, 'register_tab' );
		$this->loader->add_filter( 'affwp_settings', $plugin_affiliate_settings_tab, 'register_settings' );

	}


	protected function define_cron_hooks() {

		$cron = new Cron( $this->api, $this->logger );

		// Registers a weekly cron job if required settings are configured.
		$this->loader->add_action( 'init', $cron, 'register_cron_job' );

		$this->loader->add_action( API_Interface::UPDATE_ALL_KLAVIYO_AFFILIATE_LISTS_CRON_HOOK, $cron, 'update_all_klaviyo_affiliate_lists', 10, 1 );
	}


	protected function define_cli_commands() {

		if ( class_exists( WP_CLI::class ) ) {
			CLI::$api = $this->api;
			// vendor/bin/wp validate_address check_order 123
			WP_CLI::add_command( 'affiliates_to_klaviyo', CLI::class );
		}
	}
}

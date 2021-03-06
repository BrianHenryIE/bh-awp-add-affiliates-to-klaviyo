<?php
/**
 * The plugin bootstrap file
 *
 * This file is read by WordPress to generate the plugin information in the plugin
 * admin area. This file also includes all of the dependencies used by the plugin,
 * registers the activation and deactivation functions, and defines a function
 * that starts the plugin.
 *
 * @link              http://example.com
 * @since             1.0.0
 * @package           BH_AWP_Add_Affiliates_to_Klaviyo
 *
 * @wordpress-plugin
 * Plugin Name:       Add Affiliates to Klaviyo
 * Plugin URI:        http://github.com/BrianHenryIE/bh-awp-add-affiliates-to-klaviyo/
 * Description:       Updates Klaviyo lists when affiliates are marked active, inactive, pending, rejected.
 * Version:           2.0.1
 * Requires PHP:      7.4
 * Author:            Brian Henry
 * Author URI:        http://BrianHenry.ie
 * License:           GPL-2.0+
 * License URI:       http://www.gnu.org/licenses/gpl-2.0.txt
 * Text Domain:       bh-awp-add-affiliates-to-klaviyo
 * Domain Path:       /languages
 * GitHub Plugin URI: https://github.com/brianhenryie/bh-awp-add-affiliates-to-klaviyo
 */

namespace BH_AWP_Add_Affiliates_to_Klaviyo;

use BH_AWP_Add_Affiliates_to_Klaviyo\api\API;
use BH_AWP_Add_Affiliates_to_Klaviyo\api\Settings;
use BH_AWP_Add_Affiliates_to_Klaviyo\BrianHenryIE\WP_Logger\Logger;
use BH_AWP_Add_Affiliates_to_Klaviyo\BrianHenryIE\WPPB\WPPB_Loader;
use BH_AWP_Add_Affiliates_to_Klaviyo\includes\Activator;
use BH_AWP_Add_Affiliates_to_Klaviyo\includes\Deactivator;
use BH_AWP_Add_Affiliates_to_Klaviyo\includes\BH_AWP_Add_Affiliates_To_Klaviyo;
use BH_AWP_Add_Affiliates_to_Klaviyo\Klaviyo\Klaviyo;


// If this file is called directly, abort.
if ( ! defined( 'WPINC' ) ) {
	die;
}

require_once plugin_dir_path( __FILE__ ) . 'autoload.php';

/**
 * Currently plugin version.
 * Start at version 1.0.0 and use SemVer - https://semver.org
 * Rename this for your plugin and update it as you release new versions.
 */
define( 'BH_AWP_ADD_AFFILIATES_TO_KLAVIYO_VERSION', '2.0.1' );

/**
 * The code that runs during plugin activation.
 * This action is documented in includes/class-activator.php
 */
function activate_bh_awp_add_affiliates_to_klaviyo() {

	Activator::activate();
}

/**
 * The code that runs during plugin deactivation.
 * This action is documented in includes/class-deactivator.php
 */
function deactivate_bh_awp_add_affiliates_to_klaviyo() {

	Deactivator::deactivate();
}

register_activation_hook( __FILE__, 'BH_AWP_Add_Affiliates_to_Klaviyo\activate_bh_awp_add_affiliates_to_klaviyo' );
register_deactivation_hook( __FILE__, 'BH_AWP_Add_Affiliates_to_Klaviyo\deactivate_bh_awp_add_affiliates_to_klaviyo' );


/**
 * Begins execution of the plugin.
 *
 * Since everything within the plugin is registered via hooks,
 * then kicking off the plugin from this point in the file does
 * not affect the page life cycle.
 *
 * @since    1.0.0
 */
function instantiate_bh_awp_add_affiliates_to_klaviyo() {

	$settings = new Settings();

	$logger = Logger::instance( $settings );

	if ( ! is_null( $settings->get_klaviyo_private_api_key() ) || is_null( $settings->get_klaviyo_public_api_key() ) ) {
		$klaviyo_client = new Klaviyo( $settings->get_klaviyo_private_api_key(), $settings->get_klaviyo_public_api_key() );
	} else {
		$logger->debug(
			'Klaviyo settings not configured',
			array(
				'private_api_key' => $settings->get_klaviyo_private_api_key(),
				'public_api_key'  => $settings->get_klaviyo_public_api_key(),
			)
		);
	}

	$api    = new API( $klaviyo_client, $settings, $logger );
	$loader = new WPPB_Loader();

	/**
	 * The core plugin class that is used to define internationalization,
	 * admin-specific hooks, and frontend-facing site hooks.
	 */
	$plugin = new BH_AWP_Add_Affiliates_To_Klaviyo( $loader, $api, $settings, $logger );

	$plugin->run();

	return $api;
}

$GLOBALS['bh_awp_add_affiliates_to_klaviyo'] = instantiate_bh_awp_add_affiliates_to_klaviyo();


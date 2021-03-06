<?php
/**
 * Fired during plugin activation
 *
 * @link       http://example.com
 * @since      1.0.0
 *
 * @package    BH_AWP_Add_Affiliates_to_Klaviyo
 * @subpackage BH_AWP_Add_Affiliates_to_Klaviyo/includes
 */

namespace BH_AWP_Add_Affiliates_to_Klaviyo\includes;

/**
 * Fired during plugin activation.
 *
 * This class defines all code necessary to run during the plugin's activation.
 *
 * @since      1.0.0
 * @package    BH_AWP_Add_Affiliates_to_Klaviyo
 * @subpackage BH_AWP_Add_Affiliates_to_Klaviyo/includes
 * @author     Brian Henry <BrianHenryIE@gmail.com>
 */
class Activator {

	const LAST_ACTIVATED_TIME_OPTION_NAME = 'bh-awp-add-affiliates-to-klaviyo-last-activated-time';

	/**
	 * Short Description. (use period)
	 *
	 * Long Description.
	 *
	 * @since    1.0.0
	 */
	public static function activate() {

		// TODO: Add a banner linking to Settings.

		update_option( self::LAST_ACTIVATED_TIME_OPTION_NAME, time() );
	}

}

<?php
/**
 * Fired during plugin deactivation
 *
 * @link       http://example.com
 * @since      1.0.0
 *
 * @package    BH_AWP_Add_Affiliates_to_Klaviyo
 * @subpackage BH_AWP_Add_Affiliates_to_Klaviyo/includes
 */

namespace BH_AWP_Add_Affiliates_to_Klaviyo\includes;

use BH_AWP_Add_Affiliates_to_Klaviyo\api\API_Interface;

/**
 * Fired during plugin deactivation.
 *
 * This class defines all code necessary to run during the plugin's deactivation.
 *
 * @since      1.0.0
 * @package    BH_AWP_Add_Affiliates_to_Klaviyo
 * @subpackage BH_AWP_Add_Affiliates_to_Klaviyo/includes
 * @author     Brian Henry <BrianHenryIE@gmail.com>
 */
class Deactivator {

	/**
	 * Short Description. (use period)
	 *
	 * Long Description.
	 *
	 * @since    1.0.0
	 */
	public static function deactivate() {

		$cron_hook = API_Interface::UPDATE_ALL_KLAVIYO_AFFILIATE_LISTS_CRON_HOOK;

		if ( false !== wp_get_scheduled_event( $cron_hook ) ) {
			return;
		}

		wp_clear_scheduled_hook( $cron_hook );
	}

}

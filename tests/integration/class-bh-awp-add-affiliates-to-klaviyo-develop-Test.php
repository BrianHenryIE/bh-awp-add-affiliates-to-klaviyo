<?php
/**
 * Class Plugin_Test. Tests the root plugin setup.
 *
 * @package BH_AWP_Add_Affiliates_to_Klaviyo
 * @author     Brian Henry <BrianHenryIE@gmail.com>
 */

namespace BH_AWP_Add_Affiliates_to_Klaviyo;

use BH_AWP_Add_Affiliates_to_Klaviyo\includes\BH_AWP_Add_Affiliates_To_Klaviyo;

/**
 * Verifies the plugin has been instantiated and added to PHP's $GLOBALS variable.
 */
class Plugin_Develop_Test extends \Codeception\TestCase\WPTestCase {

	/**
	 * Test the main plugin object is added to PHP's GLOBALS and that it is the correct class.
	 */
	public function test_plugin_instantiated() {

		$this->assertArrayHasKey( 'bh_awp_add_affiliates_to_klaviyo', $GLOBALS );

		$this->assertInstanceOf( BH_AWP_Add_Affiliates_To_Klaviyo::class, $GLOBALS['bh_awp_add_affiliates_to_klaviyo'] );
	}

}

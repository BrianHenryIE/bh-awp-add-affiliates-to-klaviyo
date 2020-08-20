<?php
/**
 * Tests for BH_AWP_Add_Affiliates_to_Klaviyo main setup class. Tests the actions are correctly added.
 *
 * What is this class supposed to do? It is supposed to register all these hooks when the plugin is instantiated.
 *
 * @package BH_AWP_Add_Affiliates_to_Klaviyo
 * @author  Brian Henry <BrianHenryIE@gmail.com>
 */

namespace BH_AWP_Add_Affiliates_to_Klaviyo\includes;

use BH_AWP_Add_Affiliates_to_Klaviyo\admin\Plugins_Page;

/**
 * Class Develop_Test
 */
class BH_AWP_Add_Affiliates_to_Klaviyo_Test extends \Codeception\TestCase\WPTestCase {

	/**
	 * Plugins.php Settings link is asked to be added.
	 */
	public function test_plugins_page_settings_link_is_added() {

		$action_name       = 'plugin_action_links_bh-awp-add-affiliates-to-klaviyo/bh-awp-add-affiliates-to-klaviyo.php';
		$expected_priority = 10;
		$class_type        = Plugins_Page::class;
		$method_name       = 'action_links';

		global $wp_filter;

		$this->assertArrayHasKey( $action_name, $wp_filter, "$method_name definitely not hooked to $action_name" );

		$actions_hooked = $wp_filter[ $action_name ];

		$this->assertArrayHasKey( $expected_priority, $actions_hooked, "$method_name definitely not hooked to $action_name priority $expected_priority" );

		$hooked_methods = array();
		foreach ( $actions_hooked[ $expected_priority ] as $action ) {
			$action_function = $action['function'];
			if ( is_array( $action_function ) ) {
				if ( $action_function[0] instanceof $class_type ) {
					$hooked_methods[] = $action_function[1];
				}
			}
		}

		$this->assertNotEmpty( $hooked_methods, "No methods on an instance of $class_type hooked to $action_name" );

		$this->assertContains( $method_name, $hooked_methods, "$method_name for $class_type class not hooked to $action_name" );

	}

	/**
	 * Verify action to call load textdomain is added.
	 */
	public function test_action_plugins_loaded_load_plugin_textdomain() {

		$action_name       = 'plugins_loaded';
		$expected_priority = 10;

		$bh_awp_add_affiliates_to_klaviyo = $GLOBALS['bh_awp_add_affiliates_to_klaviyo'];

		$class = $bh_awp_add_affiliates_to_klaviyo->i18n;

		$function = array( $class, 'load_plugin_textdomain' );

		$actual_action_priority = has_action( $action_name, $function );

		$this->assertNotFalse( $actual_action_priority );

		$this->assertEquals( $expected_priority, $actual_action_priority );

	}
}

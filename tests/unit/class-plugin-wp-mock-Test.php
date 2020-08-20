<?php
/**
 * Tests for the root plugin file.
 *
 * @package BH_AWP_Add_Affiliates_to_Klaviyo
 * @author  Brian Henry <BrianHenryIE@gmail.com>
 */

namespace BH_AWP_Add_Affiliates_to_Klaviyo;

use BH_AWP_Add_Affiliates_to_Klaviyo\includes\BH_AWP_Add_Affiliates_To_Klaviyo;

/**
 * Class Plugin_WP_Mock_Test
 */
class Plugin_WP_Mock_Test extends \Codeception\Test\Unit {

	protected function _before() {
		\WP_Mock::setUp();
	}

	/**
	 * Verifies the plugin initialization.
	 */
	public function test_plugin_include() {

		$plugin_root_dir = dirname( __DIR__, 2 ) . '/src';

		\WP_Mock::userFunction(
			'plugin_dir_path',
			array(
				'args'   => array( \WP_Mock\Functions::type( 'string' ) ),
				'return' => $plugin_root_dir . '/',
			)
		);

		\WP_Mock::userFunction(
			'register_activation_hook'
		);

		\WP_Mock::userFunction(
			'register_deactivation_hook'
		);

		require_once $plugin_root_dir . '/bh-awp-add-affiliates-to-klaviyo.php';

		$this->assertArrayHasKey( 'bh_awp_add_affiliates_to_klaviyo', $GLOBALS );

		$this->assertInstanceOf( BH_AWP_Add_Affiliates_To_Klaviyo::class, $GLOBALS['bh_awp_add_affiliates_to_klaviyo'] );

	}


	/**
	 * Verifies the plugin does not output anything to screen.
	 */
	public function test_plugin_include_no_output() {

		$plugin_root_dir = dirname( __DIR__, 2 ) . '/src';

		\WP_Mock::userFunction(
			'plugin_dir_path',
			array(
				'args'   => array( \WP_Mock\Functions::type( 'string' ) ),
				'return' => $plugin_root_dir . '/',
			)
		);

		\WP_Mock::userFunction(
			'register_activation_hook'
		);

		\WP_Mock::userFunction(
			'register_deactivation_hook'
		);

		ob_start();

		require_once $plugin_root_dir . '/bh-awp-add-affiliates-to-klaviyo.php';

		$printed_output = ob_get_contents();

		ob_end_clean();

		$this->assertEmpty( $printed_output );

	}

}

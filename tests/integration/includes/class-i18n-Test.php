<?php
/**
 * Tests for I18n. Tests load_plugin_textdomain.
 *
 * @package BH_AWP_Add_Affiliates_to_Klaviyo
 * @author  Brian Henry <BrianHenryIE@gmail.com>
 */

namespace BH_AWP_Add_Affiliates_to_Klaviyo\includes;

/**
 * Class BH_AWP_Add_Affiliates_to_Klaviyo_Test
 *
 * @see I18n
 */
class BH_AWP_Add_Affiliates_to_Klaviyo_I18n_Test extends \Codeception\TestCase\WPTestCase {

	/**
	 * AFAICT, this will fail until a translation has been added.
	 *
	 * @see load_plugin_textdomain()
	 * @see https://gist.github.com/GaryJones/c8259da3a4501fd0648f19beddce0249
	 */
	public function test_load_plugin_textdomain() {

		$this->markTestSkipped( 'Needs one translation before test might pass.' );

		global $plugin_root_dir;

		$this->assertTrue( file_exists( $plugin_root_dir . '/languages/' ), '/languages/ folder does not exist.' );

		// Seems to fail because there are no translations to load.
		$this->assertTrue( is_textdomain_loaded( 'bh-awp-add-affiliates-to-klaviyo' ), 'i18n text domain not loaded.' );

	}

}

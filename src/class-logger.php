<?php
/**
 * Subclass of Klogger for configuring a static instance.
 *
 * @since             1.0.0
 * @package           BH_AWP_Auto_Register_AffiliateWP_Users_on_First_URL_Use
 */

namespace BH_AWP_Add_Affiliates_to_Klaviyo;

use \BH_AWP_Add_Affiliates_to_Klaviyo\Katzgrau\KLogger\Logger as Klogger;
use BH_AWP_Add_Affiliates_to_Klaviyo\Psr\Log\LogLevel;

/**
 * Instantiate the logger to output to wp-content/logs/bh-awp-add-affiliates-to-klaviyo-DATE.log.
 *
 * Class Logger
 *
 * @package BH_AWP_Auto_Register_AffiliateWP_Users_on_First_URL_Use
 */
class Logger extends KLogger {

	/**
	 * Class instance
	 *
	 * @var Logger $instace
	 */
	protected static $instance = null;

	/**
	 * Get class instance.
	 *
	 * @return KLogger
	 */
	public static function get_instance() {
		if ( ! self::$instance ) {
			self::$instance = new self();
		}
		return self::$instance;
	}

	/**
	 * Create an instance of the logger, setting the log file filename to match the plugin slug.
	 */
	protected function __construct() {

		$log_file_directory = WP_CONTENT_DIR . '/logs';

		// Current minimum logging threshold.
		$log_level = LogLevel::DEBUG;

		$plugin_slug     = 'bh-awp-add-affiliates-to-klaviyo';
		$log_file_prefix = "$plugin_slug-";

		$options = array(
			'extension' => 'log',
			'prefix'    => $log_file_prefix,

		);

		parent::__construct( $log_file_directory, $log_level, $options );
	}

}

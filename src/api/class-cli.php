<?php

namespace BH_AWP_Add_Affiliates_to_Klaviyo\api;

use WP_CLI;
use WP_CLI_Command;

class CLI extends WP_CLI_Command {

	/** @var API_Interface */
	static $api;

	/**
	 * wp affiliates_to_klaviyo add
	 */
	public function add() {

		$manual = true;
		self::$api->update_all_klaviyo_affiliate_lists( $manual );
	}


}
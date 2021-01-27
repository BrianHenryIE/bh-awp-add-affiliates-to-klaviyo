<?php
/**
 *
 * @package BH_AWP_Add_Affiliates_to_Klaviyo
 * @author  Brian Henry <BrianHenryIE@gmail.com>
 */

namespace BH_AWP_Add_Affiliates_to_Klaviyo\api;

use BH_AWP_Add_Affiliates_to_Klaviyo\Klaviyo\Lists;

/**
 * @see API
 * @see API_Interface
 */
class API_WP_Unit_Test extends \Codeception\TestCase\WPTestCase {

	public function test_klaviyo_lists() {

		$public_key = $_ENV[ 'KLAVIYO_PUBLIC_API_KEY' ];
		$private_key = $_ENV[ 'KLAVIYO_PRIVATE_API_KEY' ];

		$klaviyo_client_lists = new Lists( $public_key, $private_key );

		/**
		 * array {
		 *  0: {
		 *      'list_name' => string
		 *      'list_id' => string
		 *  }
		 * }
		 *
		 */
		$lists = $klaviyo_client_lists->getLists();


		$affiliate_list_id = 'XFxgfP';

		$affiliate_list_details = $klaviyo_client_lists->getListDetails( $affiliate_list_id );

		$emails = array('brian@henry.com', 'jtbolen@gmail.com');

		$filtered_list_members = $klaviyo_client_lists->checkListMembership( $affiliate_list_id, $emails );

		$existing_list_members_emails = array_map( function( $element ) { return $element['email']; }, $filtered_list_members );

//		$klaviyo_client_lists->removeMembersFromList();
//		$klaviyo_client_lists->addMembersToList();



		$a = $lists;

	}

}

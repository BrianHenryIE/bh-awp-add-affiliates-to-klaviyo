<?php 

class SettingsPageCest
{
    public function _before(AcceptanceTester $I)
    {

	    $I->loginAsAdmin();
    }


	/**
	 * Check for Klaviyo tab on AffiliateWP settings page.
	 *
	 * @param AcceptanceTester $I
	 */
    public function testForKlaviyoSettingsTab(AcceptanceTester $I) {

    	$I->amOnAdminPage('admin.php?page=affiliate-wp-settings' );

    	$I->canSeeLink('Klaviyo');

    }


    public function testKlaviyoSettingsTabSaveApiKey( AcceptanceTester  $I ){

	    $I->amOnAdminPage( 'admin.php?page=affiliate-wp-settings&tab=klaviyo');

	    $I->canSeeLink('FAIL');

// TODO:

	    // Enter info

	    // Save

	    // Can see


    }

}

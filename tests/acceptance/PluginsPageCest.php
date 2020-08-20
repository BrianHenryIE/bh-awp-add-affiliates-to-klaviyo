<?php 

class PluginsPageCest
{
    public function _before(AcceptanceTester $I)
    {

	    $I->loginAsAdmin();

	    $I->amOnPluginsPage();
    }


	/**
	 *
	 * @param AcceptanceTester $I
	 */
    public function testPluginsPageForName(AcceptanceTester $I) {

    	$I->canSee('Add Affiliates to Klaviyo' );
    }

	/**
	 *
	 * @param AcceptanceTester $I
	 */
	public function testSettingsLink(AcceptanceTester $I) {

		$I->canSeeLink('Settings', 'http://localhost/bh-awp-add-affiliates-to-klaviyo/wp-admin/admin.php?page=affiliate-wp-settings&tab=klaviyo' );

	}

	/**
	 *
	 * @param AcceptanceTester $I
	 */
	public function testGithubLink(AcceptanceTester $I) {

		$I->canSeeLink('GitHub', 'https://github.com/BrianHenryIE/bh-awp-add-affiliates-to-klaviyo' );
	}


}

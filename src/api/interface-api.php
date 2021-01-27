<?php


namespace BH_AWP_Add_Affiliates_to_Klaviyo\api;

use AffWP\Affiliate;

interface API_Interface {

	const UPDATE_ALL_KLAVIYO_AFFILIATE_LISTS_CRON_HOOK = 'bh-awp-add-affliates-to-klaviyo-update-all';

	/**
	 *
	 * @param bool $manual Indicate if the function was manually invoked.
	 * @return array The changes made.
	 */
	public function update_all_klaviyo_affiliate_lists( $manual ): array;

	/** @param Affiliate $affiliate */
	public function update_klaviyo_affiliate_lists_for_single_affiliate( $affiliate ): void;

	/**
	 * Indicates if the Klaviyo username and password and list id have been set.
	 *
	 * @return bool
	 */
	public function is_configured(): bool;


}

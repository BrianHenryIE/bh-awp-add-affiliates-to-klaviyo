<?php

namespace BH_AWP_Add_Affiliates_to_Klaviyo\api;

interface Settings_Interface {

	public function get_klaviyo_private_api_key(): ?string;
	public function get_klaviyo_public_api_key(): ?string;

	/**
	 * Get the Klaviyo list ids affiliates should be added to.
	 *
	 * An associative array keyed by possible affiliate status.
	 *
	 * @return string[] 'rejected'|'pending'|'active'|'inactive' => Klaviyo list ids.
	 */
	public function get_klaviyo_affiliate_list_ids(): array;

}

This is an example response from https://umcs.comcast.net/usage_meter/login/uid?callback=?


    <response>
    	<status>
    		<error_code>0</error_code>
    		<error_text />
    		<update_url_mac>http://usagemeterapp.comcast.net/files/XFINITY_Usage_Meter.zip</update_url_mac>
    		<update_url_pc>http://usagemeterapp.comcast.net/files/XFINITY_Usage_Meter.exe</update_url_pc>
    	</status>
    	<access_token>[token-blob]/access_token>
    </response>


This is an example response from https://umcs.comcast.net/usage_meter/usage/accountCurrent


    <response>
    	<status>
    		<error_code>0</error_code>
    		<error_text />
    	</status>
    	<account ID="[number]">
    		<counter_start>2016-05-01Z</counter_start>
    		<counter_end>2016-05-31Z</counter_end>
    		<usage_total>1792</usage_total>
    		<home_usage>1792</home_usage>
    		<wifi_usage>0</wifi_usage>
    		<usage_allowable>null</usage_allowable>
    		<overage_usage>0</overage_usage>
    		<usage_remaining>98208</usage_remaining>
    		<usage_percent>1.7920</usage_percent>
    		<usage_uom>GB</usage_uom>
    		<minutes_since_last_update>30</minutes_since_last_update>
    		<billable_overage>0</billable_overage>
    		<non_billable_overage>0</non_billable_overage>
    		<additional_billable_used>0</additional_billable_used>
    		<additional_billable_included>0</additional_billable_included>
    		<additional_billable_remaining>0</additional_billable_remaining>
    		<additional_billable_percentUsed>0.0000</additional_billable_percentUsed>
    		<additional_billable_grace_amount_exceeded>false</additional_billable_grace_amount_exceeded>
    		<additional_billable_units_per_block>null</additional_billable_units_per_block>
    		<additional_billable_cost_per_block>0</additional_billable_cost_per_block>
    		<additional_billable_blocks_used>0</additional_billable_blocks_used>
    		<policy_name>Unlimited_G5</policy_name>
    		<policy_display_name>Unlimited Data Plan</policy_display_name>
    		<home_device_details>
				<device>
					<device_mac>DE:AD:BE:EF:DE:AD</device_mac>
					<device_usage>1792</device_usage>
					<policy_name>Extreme</policy_name>
					<policy_context>null</policy_context>
					<policy_type>Residential</policy_type>
				</device>
    		</home_device_details>
    	</account>
    </response>

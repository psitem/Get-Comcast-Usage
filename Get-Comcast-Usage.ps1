<#
	.SYNOPSIS 
	Retrieves usage data from the Comcast Usage Meter and posts it to InfluxDB.

	.DESCRIPTION
	Retrieves usage data from the Comcast Usage Meter and posts it to InfluxDB.

	.PARAMETER user
	Comcast Username

	.PARAMETER password
	Comcast Password

	.PARAMETER influxdbuser
	InfluxDB username

	.PARAMETER influxdbpassword
	InfluxDB password

	.PARAMETER influxdbhost
	Hostname of the InfluxDB server

	.PARAMETER influxdbport
	Port for the InfluxDB server (default 8086)

	.PARAMETER influxdbname
	InfluxDB database name

	.INPUTS
	None

	.OUTPUTS
	None

	.NOTES

	.LINK
	https://github.com/tbyehl/Get-Comcast-Usage
	
	.EXAMPLE
	.\Get-Comcast-Usage -user "username" -password "password"

	.EXAMPLE
	.\Get-Comcast-Usage -user "username" -password "password" -influxdbuser "influxdb user" -influxdbpassword "influxdb password" -influxdbname "influx-database" -influxdbhost "localhost" -influxdbport 8086
	
#>
param(
    [parameter(HelpMessage="The Comcast account username", Mandatory=$true)] [Alias("u")] [string] $user,
    [parameter(HelpMessage="Comcast account password", Mandatory=$true)] [Alias("p")] [string] $password,
    [parameter(HelpMessage="InfluxDB username", Mandatory=$false)] [Alias("iu")] [string] $influxdbuser,
    [parameter(HelpMessage="InfluxDB password", Mandatory=$false)] [Alias("ip")] [string] $influxdbpassword,
    [parameter(HelpMessage="InfluxDB host name", Mandatory=$false)] [Alias("ih")] [string] $influxdbhost,
    [parameter(HelpMessage="InfluxDB host name", Mandatory=$false)] [Alias("ihp")] [string] $influxdbport=8086,
    [parameter(HelpMessage="InfluxDB database name", Mandatory=$false)] [Alias("id")] [string] $influxdbname
    )
    
$COMCAST_API_VERSION = 4.3

$LOGIN_URL = 'https://umcs.comcast.net/usage_meter/login/uid?callback=?'
$USAGE_URL = 'https://umcs.comcast.net/usage_meter/usage/accountCurrent'

$session = New-Object Microsoft.PowerShell.Commands.WebRequestSession
$payload = @{ username = $user ; password = $password ; version = $COMCAST_API_VERSION }
$resp = Invoke-RestMethod -WebSession $session -Method POST -Body $payload -Uri $LOGIN_URL
$token = $resp.response.access_token

$usage_payload = @{username = $user ; access_token = $token ; version = $COMCAST_API_VERSION }

$tmp = Invoke-RestMethod -WebSession $session -Method POST -Body $usage_payload -Uri $USAGE_URL
$usage = $tmp.response.account.usage_total

$usage

if (($influxdbuser -ne "") -and ($influxdbpassword -ne "") -and ($influxdbname -ne "") -and ($influxdbhost -ne "") ) {
    Write-host "Posting to InfluxDB"

    $line = "comcast_usage,label=""Usage"" value=$usage `n"

    $authheader = "Basic " + ([Convert]::ToBase64String([System.Text.encoding]::ASCII.GetBytes("$($influxdbuser):$($influxdbpassword)")))
    $uri = "http://$($influxdbhost):$($influxdbport)/write?db=$influxdbname"
    try {Invoke-RestMethod -Headers @{Authorization=$authheader} -Uri $uri -Method POST -Body $line | Out-Null}
    catch { Write-host "Error posting to InfluxDB" ; throw $_ }
}

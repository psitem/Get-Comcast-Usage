# Get-Comcast-Usage
Retrieves the Comcast Usage Meter value and optionally posts to an InfluxDB database. This script is minimally tested and doesn't have any error handling. Don't blame me if it kicks your spouse or runs off with your dog.

Inspired by https://github.com/WTFox/comcastUsage


# Usage

	.\Get-Comcast-Usage.ps1 -user "username" -password "password"

	.\Get-Comcast-Usage.ps1 -user "username" -password "password" -influxdbuser "influxdb user" -influxdbpassword "influxdb password" -influxdbname "influx-database" -influxdbhost "localhost" -influxdbport 8086


![](http://i.imgur.com/NCLpyUU.png)

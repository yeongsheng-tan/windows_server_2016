# stop ps1 script on first error
$ErrorActionPreference = "Stop"

cinst -y --force MsSqlServer2017Express
cinst -y --force MsSqlServerManagementStudio2017Express
refreshenv

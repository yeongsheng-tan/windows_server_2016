# stop ps1 script on first error
$ErrorActionPreference = "Stop"

cinst -y --force IIS-WebServerRole -source windowsfeatures
cinst -y --force IIS-ISAPIFilter --source WindowsFeatures
cinst -y --force IIS-ISAPIExtensions --source WindowsFeatures
cinst -y --force IIS-NetFxExtensibility --source WindowsFeatures
cinst -y --force IIS-ASPNET --source WindowsFeatures
refreshenv

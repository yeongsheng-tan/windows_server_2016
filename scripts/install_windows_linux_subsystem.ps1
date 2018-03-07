# stop ps1 script on first error
$ErrorActionPreference = "Stop"

#cinst -y --force Microsoft-Windows-Subsystem-Linux -source WindowsFeatures
Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1604 -OutFile ~/Ubuntu.zip -UseBasicParsing
Expand-Archive ~/Ubuntu.zip ~/Ubuntu
C:\Users\vagrant\ubuntu.exe /s /v /qn ALLUSERS=1 REBOOT=ReallySuppress

# stop ps1 script on first error - similar to 'set -e' in unix shell
$ErrorActionPreference = "Stop"

$ChocoInstallPath = "$env:SystemDrive\ProgramData\Chocolatey\bin"

if (!(Test-Path $ChocoInstallPath)) {
  iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
}

######################################################
# Download custom PowerShell profile file
######################################################
# Write-Host "Creating custom $profile for Powershell"
# if (!(test-path $profile)) {
#     New-Item -path $profile -type file -force
# }
# Add-Content $profile ((new-object net.webclient).DownloadString('http://bit.ly/profileps'))

# stop ps1 script on first error - similar to 'set -e' in unix shell
$ErrorActionPreference = "Stop"

# install curl Gow grepwin Wget 7zip babun cmder psake NuGet
cinst -y --force curl
cinst -y --force Gow
cinst -y --force grepwin
cinst -y --force Wget
cinst -y --force 7zip
cinst -y --force babun
# cinst -y --force cmder
cinst -y --force psake
cinst -y --force NuGet.CommandLine
cinst -y --force NugetPackageExplorer
cinst -y --force bash --source cygwin
Install-PackageProvider -Name NuGet -Force
refreshenv

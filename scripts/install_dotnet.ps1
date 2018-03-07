# stop ps1 script on first error - similar to 'set -e' in unix shell
$ErrorActionPreference = "Stop"

# Add-WindowsFeature as-net-framework
# Enable dotnet4
Dism /online /Enable-Feature /FeatureName:NetFx4 /All

# stop ps1 script on first error - similar to 'set -e' in unix shell
$ErrorActionPreference = "Stop"

cinst -y Microsoft-Hyper-V-All -source windowsFeatures
refreshenv

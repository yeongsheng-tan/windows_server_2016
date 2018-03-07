# stop ps1 script on first error - similar to 'set -e' in unix shell
$ErrorActionPreference = "Stop"

cinst -y --force windowsazurepowershell
cinst -y --force azure-cli
refreshenv

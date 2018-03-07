# stop ps1 script on first error - similar to 'set -e' in unix shell
$ErrorActionPreference = "Stop"

cinst -y --force visualstudio2017community
refreshenv

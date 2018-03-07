# stop ps1 script on first error - similar to 'set -e' in unix shell
$ErrorActionPreference = "Stop"

cinst -y --force virtualbox
cinst -y --force virtualbox.extension
cinst -y --force vagrant
refreshenv

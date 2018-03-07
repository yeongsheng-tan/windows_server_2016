# stop ps1 script on first error - similar to 'set -e' in unix shell
$ErrorActionPreference = "Stop"

cinst -y --force python2
$env:Path += ";C:\Python27\"
refreshenv
cinst -y --force pip
# cinst -y --force easy_install

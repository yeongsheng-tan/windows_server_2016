# stop ps1 script on first error - similar to 'set -e' in unix shell
$ErrorActionPreference = "Stop"

cinst -y --force nodejs
cinst -y --force nodejs.install
$env:Path += ";C:\Program Files\nodejs\"
refreshenv
npm install -g npm-windows-upgrade
$env:Path += ";C:\Users\vagrant\AppData\Roaming\npm\node_modules\npm-windows-upgrade\bin\"
refreshenv
npm-windows-upgrade --npm-version latest

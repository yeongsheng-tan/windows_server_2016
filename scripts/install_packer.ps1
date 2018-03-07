# stop ps1 script on first error - similar to 'set -e' in unix shell
$ErrorActionPreference = "Stop"

cinst -y --force packer --version 1.1.3
cinst -y --force packer-windows-plugins
cinst -y --force packer-provisioner-windows-update
refreshenv

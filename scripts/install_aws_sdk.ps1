# stop ps1 script on first error - similar to 'set -e' in unix shell
$ErrorActionPreference = "Stop"

cinst -y --force ruby
cinst -y --force ruby.devkit
$env:Path += ";C:\tools\ruby25\bin\;C:\tools\DevKit\bin\"
refreshenv
gem update --system
bundle config jobs 4
cinst -y --force awscli
cinst -y --force awstools.powershell

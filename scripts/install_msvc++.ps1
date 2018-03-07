# stop ps1 script on first error
$ErrorActionPreference = "Stop"

cinst -y --force vcredist2005
cinst -y --force vcredist2008
cinst -y --force vcredist2010
cinst -y --force vcredist2012
cinst -y --force vcredist2015
cinst -y --force vcredist2017
refreshenv

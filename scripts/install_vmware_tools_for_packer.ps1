# stop ps1 script on first error - similar to 'set -e' in unix shell
$ErrorActionPreference = "Stop"

# Set-PowerCLIConfiguration -Scope User -ParticipateInCEIP $false
# cinst -y --force vmware-workstation-player # ver12.5.4
# $packageName = 'vmwareworkstation-player'
# $installerType = 'exe'
# $url = 'https://s3-us-west-2.amazonaws.com/ruckus-rsa/public/vmware-player-12.5.9.exe'
# $url64 = $url
# $checksum = 'eeed223167f797b4daf5315e9349eb404150b719'
# $checksum64 = $checksum
# $checksumType = 'sha1'
# $silentArgs = '/s /v/qn EULAS_AGREED=1'
# $validExitCodes = @(0)

# Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"  -validExitCodes $validExitCodes -checksum $checksum -checksumType $checksumType -checksum64 $checksum64

# install vmwareplayer
Invoke-WebRequest 'https://s3-us-west-2.amazonaws.com/ruckus-rsa/public/vmware-player-12.5.9.exe' -OutFile 'C:\tmp\vmware-player.exe'
C:\tmp\vmware-player.exe /s /v /qn EULAS_AGREED=1 AUTOSOFTWAREUPDATE=0 ALLUSERS=1 REBOOT=ReallySuppress
refreshenv

# install vmware-vix - VMWare-VIX is installed as part of vmware-powercli (see https://blogs.vmware.com/PowerCLI/2011/06/back-to-basics-part-1-installing-powercli.html)
Invoke-WebRequest 'https://s3-us-west-2.amazonaws.com/ruckus-rsa/public/vmware-vix-1.15.8.exe' -OutFile 'C:\tmp\vmware-vix.exe'
C:\tmp\vmware-vix.exe /s /v /qn EULAS_AGREED=1 AUTOSOFTWAREUPDATE=0 ALLUSERS=1 REBOOT=ReallySuppress
refreshenv

# install ovftool
#Invoke-WebRequest 'https://s3-us-west-2.amazonaws.com/ruckus-rsa/public/vmware-ovftool-4.2.0.x86_64.msi' -OutFile 'C:\tmp\ovftool.msi'
#Start-Process msiexec.exe -Wait -ArgumentList '/I C:\tmp\ovftool.msi /quiet /qn /norestart EULAS_AGREED=1 AUTOSOFTWAREUPDATE=0 ALLUSERS=1 REBOOT=ReallySuppress'
#refreshenv

# install power-cli
cinst -y --force vmware-powercli-psmodule
cinst -y --force packer-post-processor-vagrant-vmware-ovf
cinst -y --force docker-machine-vmwareworkstation
refreshenv

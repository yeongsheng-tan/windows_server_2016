# stop ps1 script on first error
$ErrorActionPreference = "Stop"

# http://networkerslog.blogspot.com.br/2013/09/how-to-enable-remote-desktop-remotely.html
# set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server'-name "fDenyTSConnections" -Value 0
# http://www.tomsitpro.com/articles/enable-remote-desktop-in-windows-server-2016,2-1102.html
# creates the fDenyTSConnections value and sets it to 0 (off)
New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name "fDenyTSConnections" -Value 0 -PropertyType dword -Force
# creates and enables the UserAuthentication (Network Layer Authentication) value
New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name 'UserAuthentication' -Value 1 -PropertyType dword -Force
# enables the predefined "Remote Desktop" Windows Firewall rule
Enable-NetFirewallRule -DisplayGroup 'Remote Desktop'

# Install Windows Linux Subsystem to Windows 10
# Display Demo Machine Information
# Get-ComputerInfo | `
#   Select-Object `
#   @{N='Hostname';E={$env:COMPUTERNAME}}, `
#   WindowsProductName, `
#   WindowsCurrentVersion, `
#   WindowsVersion, `
#   WindowsBuildLabEx | `
#   Format-Table `
#   -AutoSize ;

# Validate if Linux Subsystem feature state has been enabled on Windows 10
# Get-WindowsOptionalFeature `
#   -FeatureName Microsoft-Windows-Subsystem-Linux `
#   -Online ;

# Enable the Microsoft Windows Subsystem Linux Feature on Windows 10
#  and reboot the Windows 10
# Enable-WindowsOptionalFeature `
#   -FeatureName Microsoft-Windows-Subsystem-Linux `
#   -Online `
#   -NoRestart:$False ;

# Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
# To immediately start using Bash from the current default Ubuntu distro
# lxrun /install /y

######################################################
# Set environment variables
######################################################
# Write-Host "Setting home variable"
# [Environment]::SetEnvironmentVariable("HOME", $HOME, "User")

######################################################
# Download custom .bashrc file
######################################################
# Write-Host "Creating .bashrc file for use with Git Bash"
# $filePath = $HOME + "\.bashrc"
# New-Item $filePath -type file -value ((new-object net.webclient).DownloadString('http://bit.ly/winbashrc'))

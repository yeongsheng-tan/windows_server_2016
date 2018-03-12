$ErrorActionPreference = "Stop"
# Set execution policy of scripts
Set-ExecutionPolicy Bypass # trust all scripts

$ruckus_rsa_s3_public_download_base_url = "https://s3-us-west-2.amazonaws.com/ruckus-rsa/public"
$packer_version = "1.1.3"
$vmware_player_version = "12.5.9"
$vmware_vix_version = "1.15.8"

# Define PATH env var to include existing packages from Machine and User namespace
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Install Chocolatey package manager
Function Install-Chocolatey()
{
  $ChocoInstallPath = "$env:SystemDrive\ProgramData\Chocolatey\bin"

  if (!(Test-Path $ChocoInstallPath)) {
    iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
  }

  refreshenv
}

# Install basic utilities
Function Install-Basic-Utilities()
{
  cinst -y --force 7zip
  cinst -y --force curl
  cinst -y --force Gow
  cinst -y --force Wget
  cinst -y --force NuGet.CommandLine
  Install-PackageProvider -Name NuGet -Force

  refreshenv
}

# Enable MS dotNet4 feature
Function Enable-DotNet4()
{
  Dism /online /Enable-Feature /FeatureName:NetFx4 /All
}

# Install MS VC++ packages for compilation and runtime support of downstream utilities and packages
Function Install-MSVC()
{
  cinst -y --force vcredist2005
  cinst -y --force vcredist2008
  cinst -y --force vcredist2010
  cinst -y --force vcredist2012
  cinst -y --force vcredist2015
  cinst -y --force vcredist2017
}

# Install git and powershell git add-ons
Function Install-Git()
{
  cinst -y --force git.install
  cinst -y --force poshgit
  cinst -y --force git-credential-winstore

  ######################################################
  # Add Git to the path
  ######################################################
  Write-Host "Adding Git\bin to the path"
  $env:path += ";" + (Get-Item "Env:ProgramFiles(x86)").Value + "\Git\bin"
  refreshenv
}

# Install Python27
Function Install-Python27()
{
  cinst -y --force python2
  ######################################################
  # Add Python2 to the path
  ######################################################
  $env:Path += ";C:\Python27\"
  refreshenv

  cinst -y --force --allow-empty-checksums pip
}

# Install AWS-SDK() {
Function Install-AWS-SDK()
{
  cinst -y --force ruby
  cinst -y --force ruby.devkit
  ######################################################
  # Add Ruby to the path
  ######################################################
  $env:Path += ";C:\tools\ruby25\bin;C:\tools\DevKit\bin\"
  refreshenv

  gem update --system
  bundle config jobs 4
  cinst -y --force awscli awstools.powershell
}

# Install Azure CLI to powershell
Function Install-Azure-CLI()
{
  cinst -y --force windowsazurepowershell
  cinst -y --force azure-cli
}

# Install MS Hyper-V feature
Function Install-Hyper-V()
{
  cinst -y --force Microsoft-Hyper-V-All -source windowsFeatures
}

# Install Hashicorp Packer for MS Windows
Function Install-Packer()
{
  cinst -y --force packer --version $packer_version
  cinst -y --force packer-windows-plugins
  cinst -y --force packer-provisioner-windows-update
}

# Install VMWare tooling for packer build requirements
Function Install-VMWare-Tooling()
{
  # Install VMWare Workstation Player
  Write-Host "Installing VMWare Workstation Player version $vmware_player_version"
  Invoke-WebRequest "$ruckus_rsa_s3_public_download_base_url/vmware-player-$vmware_player_version.exe" -OutFile 'C:\tmp\vmware-player.exe'
  C:\tmp\vmware-player.exe /s /v /qn EULAS_AGREED=1 AUTOSOFTWAREUPDATE=0 ALLUSERS=1 REBOOT=ReallySuppress

  # Install VMWare-VIX drivers
  Write-Host "Installing VMWare VIX Driver version $vmware_vix_version"
  Invoke-WebRequest "$ruckus_rsa_s3_public_download_base_url/vmware-vix-$vmware_vix_version.exe" -OutFile 'C:\tmp\vmware-vix.exe'
  C:\tmp\vmware-vix.exe /s /v /qn EULAS_AGREED=1 AUTOSOFTWAREUPDATE=0 ALLUSERS=1 REBOOT=ReallySuppress
  refreshenv

  # install VMWare Power-CLI for powershell
  cinst -y --force vmware-powercli-psmodule
  cinst -y --force packer-post-processor-vagrant-vmware-ovf
  # cinst -y --force docker-machine-vmwareworkstation
  refreshenv
}

Install-Chocolatey
Install-Basic-Utilities
Enable-DotNet4
Install-MSVC
Install-Git
Install-Python27
Install-AWS-SDK
Install-Azure-CLI
Install-Hyper-V
Install-Packer
Install-VMWare-Tooling

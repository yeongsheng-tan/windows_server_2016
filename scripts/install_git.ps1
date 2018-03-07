# stop ps1 script on first error
$ErrorActionPreference = "Stop"

cinst -y --force git.install
cinst -y --force poshgit

# Restart PowerShell / CMDer before moving on - or run
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

cinst -y --force git-credential-winstore
# cinst -y --force github
refreshenv

# function Add-Path() {
#   [Cmdletbinding()]
#   param([parameter(Mandatory=$True,ValueFromPipeline=$True,Position=0)][String[]]$AddedFolder)
#   # Get the current search path from the environment keys in the registry.
#   $OldPath=(Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).Path
#   # See if a new folder has been supplied.
#   if (!$AddedFolder) {
#     Return 'No Folder Supplied. $ENV:PATH Unchanged'
#   }
#   # See if the new folder exists on the file system.
#   if (!(TEST-PATH $AddedFolder)) {
#     Return 'Folder Does not Exist, Cannot be added to $ENV:PATH'
#   }
#   # See if the new Folder is already in the path.
#   if ($ENV:PATH | Select-String -SimpleMatch $AddedFolder) {
#     Return 'Folder already within $ENV:PATH'
#   }
#   # Set the New Path
#   $NewPath=$OldPath+';'+$AddedFolder
#   Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH –Value $newPath
#   # Show our results back to the world
#   Return $NewPath
# }

######################################################
# Add Git to the path
######################################################
Write-Host "Adding Git\bin to the path"
$env:path += ";" + (Get-Item "Env:ProgramFiles(x86)").Value + "\Git\bin"
refreshenv
# Add-Path "C:\Program Files (x86)\Git\bin"

######################################################
# Generate public/private rsa key pair
######################################################
# cinst -y --force openssh -params '"/SSHServerFeature /KeyBasedAuthenticationFeature"'
######################################################
# Generate public/private rsa key pair
######################################################
# Write-Host "Generating public/private rsa key pair"
# Set-Location $home
# $dirssh = "$home\.ssh"
# mkdir $dirssh
# $filersa = $dirssh + "\id_rsa"
# ssh-keygen -t rsa -f $filersa -q -C $userEmail

# Restart-Computer

######################################################
# Configure Git globals
######################################################
# Write-Host "Configuring Git globals"
# $userName = Read-Host 'Enter your name for git configuration'
# $userEmail = Read-Host 'Enter your email for git configuration'

# & 'C:\Program Files (x86)\Git\bin\git' config --global user.email $userEmail
# & 'C:\Program Files (x86)\Git\bin\git' config --global user.name $userName

# $gitConfig = $home + "\.gitconfig"
# Add-Content $gitConfig ((new-object net.webclient).DownloadString('http://bit.ly/mygitconfig'))

# $gitexcludes = $home + "\.gitexcludes"
# Add-Content $gitexcludes ((new-object net.webclient).DownloadString('http://bit.ly/gitexcludes'))

$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine")
refreshenv

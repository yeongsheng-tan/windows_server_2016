# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'virtualbox'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # config.vm.box = "mwrock/Windows2016"
  # config.vm.box = "symbols/windows_server_1709_docker"
  # config.vm.box = "eratiner/w2016x64vmX"
  config.vm.box = "giorgioinf/win10N-shell"
  # config.vm.box = "StefanScherer/windows_2016_docker"
  # define Vagrant communicator to use WinRM
  config.vm.communicator = "winrm"

  # hostname and ip
  config.vm.hostname = "winhost"
  config.vm.network "private_network", ip: "192.168.99.103"
  config.vm.network :forwarded_port, guest: 3389, host: 3389

  # use powershell provisioner
  # vagrant provision --provision-with windows-update
  # config.vm.provision :shell, path: "scripts/install_chocolatey.ps1"
  # config.vm.provision :shell, path: "scripts/install_dotnet.ps1"
  # config.vm.provision :shell, path: "scripts/install_msvc++.ps1"
  # config.vm.provision :shell, path: "scripts/install_utils.ps1"
  # config.vm.provision :shell, path: "scripts/install_npm.ps1"
  # config.vm.provision :shell, path: "scripts/install_python.ps1"
  # config.vm.provision :shell, path: "scripts/install_git.ps1"
  # config.vm.provision :shell, path: "scripts/install_aws_sdk.ps1"
  # config.vm.provision :shell, path: "scripts/install_azure_cli.ps1"
  # config.vm.provision :shell, path: "scripts/install_packer.ps1"
  # config.vm.provision :shell, path: "scripts/install_vmware_tools_for_packer.ps1"
  # config.vm.provision :shell, path: "scripts/install_mssqlserverexpress.ps1"
  # config.vm.provision :shell, path: "scripts/install_iis.ps1"
  # config.vm.provision :shell, path: "scripts/install_vsstudiocommunity.ps1"
  # config.vm.provision :shell, path: "scripts/install_hyper_v.ps1"
  # config.vm.provision :shell, path: "scripts/enable_rdp.ps1"
  # config.vm.provision :shell, path: "scripts/install_openssh.ps1"
  # config.vm.provision :shell, path: "scripts/install_windows_linux_subsystem.ps1"
  config.vm.provision :shell, path: "provision.ps1"
end

# -*- mode: ruby -*-
# vim: set ft=ruby :
# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config| 
  # Get the official Ubuntu trusty64 box
    config.vm.define "rdap" do |rdap|
        #config.vm.box = 'smbambling/centos66-64' #This one for CentOS
        config.vm.box = 'ubuntu/trusty64'       #This one for Ubuntu
        config.vm.hostname = 'arin-rdap'
    end
    
    config.vm.provision :shell, :path => "bootstrap/puppet_agent.sh"
    config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "puppet/manifests"
        puppet.manifest_file = "site.pp"
        puppet.module_path = "puppet/modules"
    end 
end

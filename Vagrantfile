# -*- mode: ruby -*-
# vim: set ft=ruby :
# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

DOMAIN="example.dev"

# Pick your preferred flavor to build on
BOX = "smbambling/centos66-64" # This one for CentOS
#BOX="ubuntu/trusty64" # This one for Ubuntu

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config| 
    config.vm.define "rdap".to_sym do |rdap|
        rdap.vm.box = BOX
        rdap.vm.network "forwarded_port", guest: 8080, host: 8080, protocol: 'tcp'
        rdap.vm.hostname = "arin-rdap" + "." + DOMAIN
        rdap.vm.provision :shell, :path => "bootstrap/puppet_agent.sh"
        rdap.vm.provision :shell, :path => "bootstrap/puppet_modules.sh"
        rdap.vm.provision :puppet,
            :manifests_path => "puppet/manifests",
            :module_path => "puppet/modules",
            :manifest_file => "site.pp"
    end
end     

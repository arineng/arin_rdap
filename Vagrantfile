# -*- mode: ruby -*-
Vagrant.configure(2) do |config|
  
  # Get the official Ubuntu trusty64 box
    config.vm.box = 'ubuntu/trusty64'
    config.vm.hostname = 'arin-rdap'
    
  
    config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "puppet/manifests"
        puppet.manifest_file = "site.pp"
        puppet.module_path = "puppet/modules"
    end 
end

# -*- mode: ruby -*-
Vagrant.configure(2) do |config|
  
  # Get the official Ubuntu trusty64 box
    config.vm.box = "ubuntu/trusty64"
  
  
    config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "manifests"
        puppet.manifest_file = "my_manifest.pp"
    end 
end

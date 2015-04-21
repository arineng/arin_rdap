# arin_rdap
A very simple vagrant machine that currently uses either Ubuntu or CentOS designed to successfully build the [ARIN rdap development server](http://projects.arin.net/rdapbootstrap). Feel free to customize to suit your needs.

Instructions: 

This project uses submodules, so be sure to use `--recursive` when cloning

```
git clone --recursive https://github.com/champain/arin_rdap.git
cd arin_rdap
vagrant up
```

If you'd like to use CentOS or Ubuntu you simply need to uncomment the relevant config line for your preferred OS:

```ruby
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config| 
  # Get the official Ubuntu trusty64 box
    config.vm.define "rdap" do |rdap|
        config.vm.box = 'smbambling/centos66-64'
        #config.vm.box = 'ubuntu/trusty64'
        config.vm.hostname = 'arin-rdap'
    end 
```

This box also now deploys the war on tomcat and rolls nicinfo at `/opt/nicinfo/bin/nicinfo`.
```
vagrant@arin-rdap:/opt/nicinfo/bin$ ./nicinfo -V -b http://127.0.0.1:8080/rdap_bootstrap_server-1000.0-SNAPSHOT ns1.verisign.com
# NicInfo v.1000.0.0-SNAPSHOT
## Using configuration found in /home/vagrant/.NicInfo
## Evicted 0 files from the cache
## Assuming query value is NAMESERVER
## Issuing GET for http://127.0.0.1:8080/rdap_bootstrap_server-1000.0-SNAPSHOT/nameserver/ns1.verisign.com
## Issuing GET for http://tlab.verisign.com/COM/nameserver/ns1.verisign.com
```

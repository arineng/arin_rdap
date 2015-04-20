#!/usr/bin/env bash
# Credit to smbambling
set -e

if [ "$EUID" -ne "0" ] ; then
  echo "Script must be run as root." >&2
  exit 1
fi

if which puppet > /dev/null ; then
  echo "Puppet is already installed"
  exit 0
fi

releasever=$(rpm -q --qf "%{version}" -f /etc/redhat-release)
arch=$(rpm -q --qf "%{arch}" -f /etc/redhat-release)

# Generate a Passphraseless SSH key for the root user
ssh-keygen -t rsa -P "" -f ~/.ssh/id_rsa

if [ ! -f /home/vagrant/repos_added.txt ]; then
  echo "Installing Puppet Repository"
  #sudo rpm -ivh http://yum.puppetlabs.com/el/6/products/x86_64/puppetlabs-release-6-7.noarch.rpm
  sudo rpm -ivh http://yum.puppetlabs.com/el/${releasever}/products/${arch}/puppetlabs-release-${releasever}-11.noarch.rpm
else
  echo "Puppet Repostiroy Already Added"
fi

if [ ! -f /home/vagrant/puppet_agent_installed.txt ]; then
  echo "Installing Puppet Agent"
  sudo yum -y install puppet facter
else
  echo "Puppet is already installed"
fi

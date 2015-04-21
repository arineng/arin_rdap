#!/usr/bin/env bash
modules=(stdlib tomcat vcsrepo)

for i in ${modules[*]} ; do
  if [ -f /etc/puppet/modules/$i ] ; then
    echo "Installing Puppet Module $i"
    puppet module install puppetlabs-$i
  else
    echo "Puppet module $i is already installed"
  fi

done
exit 0

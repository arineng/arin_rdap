# Baseconfig includes necessary packages for build
include baseconfig

# Be sure to clone after package installs
# Be sure to run the maven build after cloning
vcsrepo { '/opt/rdap/code':
  ensure   => present,
  provider => git,
  source   => "http://stash-projects.arin.net:7990/scm/rrr/code.git",
  user     => 'vagrant',
  owner    => 'vagrant',
  group    => 'vagrant',
  require  => [ Class["baseconfig"]]
  before   => Exec['mvn_package'],
}

# Run the package build command
exec { 'mvn_package':
  command => "/usr/bin/mvn package -e -f /home/vagrant/code/pom.xml",
}


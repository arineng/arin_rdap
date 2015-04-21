# Baseconfig includes necessary packages for build
include baseconfig
include stdlib

# Be sure to clone after package installs
# Be sure to run the maven build after cloning

file { '/opt/rdap':
  ensure => directory
}

vcsrepo { '/opt/rdap/code':
  ensure   => present,
  provider => git,
  source   => "http://stash-projects.arin.net:7990/scm/rrr/code.git",
  require  => [ Class["baseconfig"]],
  before   => Exec['mvn_package'],
}

vcsrepo { '/opt/nicinfo':
  ensure   => present,
  provider => git,
  source   => "http://stash-projects.arin.net:7990/scm/NIC/main.git",
}

# Run the package build command
exec { 'mvn_package':
  command => "/usr/bin/mvn package -e -f /opt/rdap/code/pom.xml",
}

class { 'tomcat': }
tomcat::service { 'default':
  use_jsvc     => false,
  use_init     => true,
  service_name => 'tomcat7',
}

tomcat::war { 'rdap_bootstrap_server-1000.0-SNAPSHOT.war':
  catalina_base => '/var/lib/tomcat7',
  war_source    => '/opt/rdap/code/target/rdap_bootstrap_server-1000.0-SNAPSHOT.war',
  require       => Exec['mvn_package'],
}

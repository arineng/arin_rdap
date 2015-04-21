# == Class: baseconfig
#
# Performs initial configuration tasks for all Vagrant boxes.
#
class baseconfig {
  case $operatingsystem  {
    CentOS: { 
      $update_command = '/usr/bin/yum update -y' 
      $java_packages = ['java-1.6.0-openjdk', 'apache-maven', 'git']
      yumrepo { "apache-maven":
        baseurl  => 'http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-$releasever/$basearch/',
        descr    => "Apache Maven from fedorapeople",
        enabled  => 1,
        gpgcheck => 0,
        before   => Package[$java_packages]
      }
    } 
    Ubuntu: { 
      $update_command = '/usr/bin/apt-get update'
      $java_packages = ['maven', 'maven2', 'default-jdk', 'git']
    } 
  }
  exec { $update_command :
    command => $update_command,
  }

  package { $java_packages : 
    ensure  => present,
    require => Exec[$update_command],
  }
}

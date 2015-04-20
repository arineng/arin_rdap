# == Class: baseconfig
#
# Performs initial configuration tasks for all Vagrant boxes.
#
class baseconfig {
  exec { 'apt-get update':
    command => '/usr/bin/apt-get update';
  }

  Package {
    ensure  => present,
    require => Exec['apt-get update'],
  }

  package { 'git': }

  package { 'maven': }

  package { 'maven2':}

  package { 'default-jdk': }
}

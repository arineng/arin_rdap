# == Class: baseconfig
#
# Performs initial configuration tasks for all Vagrant boxes.
#
class baseconfig {
  exec { 'apt-get update':
    command => '/usr/bin/apt-get update';
  }

  package { 'git':
    ensure => present,
  }

  package { 'maven':
    ensure => present,
  }

  package { 'maven2':
    ensure => present,
  }

  package { 'default-jdk':
    ensure => present,
  }
}

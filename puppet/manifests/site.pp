stage {'pre':
  before => Stage['main']
}

class { 'baseconfig':
  stage => 'pre'
}

vcsrepo { '/home/vagrant/code':
  ensure   => present,
  provider => git,
  source   => "http://stash-projects.arin.net:7990/scm/rrr/code.git",
  user     => 'vagrant',
  owner    => 'vagrant',
  group    => 'vagrant',
  before   => Exec['mvn_package'],
}

exec { 'mvn_package':
  command => "/usr/bin/mvn package -e -f /home/vagrant/code/pom.xml",
  user    => 'vagrant',
}

include baseconfig

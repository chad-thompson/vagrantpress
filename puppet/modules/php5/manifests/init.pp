# Install PHP

class php5 {

  package { [
    'php5',
    'php5-mysql',
    'php5-curl',
    'php5-gd',
    'php5-fpm',
    'libapache2-mod-php5',
    'php5-dev',
    'php5-xdebug',
    'php-pear',
  ]:
    ensure => present,
  }

  # upgrade pear
  exec {'pear upgrade':
    command => '/usr/bin/pear upgrade',
    require => Package['php-pear'],
  }

  # set channels to auto discover
  exec { 'pear auto_discover' :
    command => '/usr/bin/pear config-set auto_discover 1',
    require => Package['php-pear'],
  }

  # update channels
  exec { 'pear update-channels' :
    command => '/usr/bin/pear update-channels',
    require => Package['php-pear'],
  }
}

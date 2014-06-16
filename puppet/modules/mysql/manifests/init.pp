#Install MySQL

class mysql {

  $password = 'vagrant'

  package { [
    'mysql-client',
    'mysql-server',
  ]:
    ensure => installed,
  }

  service { 'mysql':
    ensure  => running,
    enable  => true,
    require => Package['mysql-server'],
  }

  exec { 'Set MySQL server\'s root password':
    subscribe   => [
      Package['mysql-client'],
      Service['mysql'],
      ],
    refreshonly => true,
    command     => "/usr/bin/mysqladmin -uroot password ${password}",
  }
}

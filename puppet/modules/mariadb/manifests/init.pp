#Install MariaDB

class mariadb::install {

  $password = 'vagrant'

  package { [
      'mariadb-client',
      'mariadb-server',
    ]:
    ensure => installed,
  }

  exec { 'Set MySQL server\'s root password':
    subscribe   => [
      Package['mariadb-server'],
      Package['mariadb-client'],
    ],
    refreshonly => true,
    unless      => "mysqladmin -uroot -p${password} status",
    command     => "mysqladmin -uroot password ${password}",
  }

}

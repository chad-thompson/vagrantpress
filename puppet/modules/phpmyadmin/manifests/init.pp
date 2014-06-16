# Install phpMyAdmin

class phpmyadmin {

  include apache2

  package { 'phpmyadmin':
    ensure => present,
  }

  file { [
    '/etc',
    '/etc/apache2',
    '/etc/apache2/sites-enabled',
  ]:
    ensure => directory
  }

  file { '/etc/apache2/sites-enabled/001-phpmyadmin':
    ensure  => link,
    target  => '/etc/phpmyadmin/apache.conf',
    notify  => Service['apache2'],
    require => [
      Package['phpmyadmin'],
      File['/etc/apache2/sites-enabled'],
      ],
  }

}

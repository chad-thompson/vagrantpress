# Install PHP

class php5::install {

  package { [
    'php5',
    'php5-mysql',
    'php5-curl',
    'php5-gd',
    'php5-fpm',
    'libapache2-mod-php5',
    'php5-dev',
    'php5-xdebug'
  ]:
  ensure => present,
  }

  file_line { 'php_max_upload_remove_default':
    path    => '/etc/php5/apache2/php.ini',
    line    => 'upload_max_filesize = 2M',
    ensure  => 'absent',
    require => Package['php5'],
  }

  file_line { 'php_max_upload_add_custom':
    path    => '/etc/php5/apache2/php.ini',
    line    => 'upload_max_filesize = 200M',
    after   => '; http://php.net/upload-max-filesize',
    require => Package['php5'],
  }
}

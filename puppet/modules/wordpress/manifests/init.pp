# Install latest Wordpress

class wordpress {

  require mysql

  # Create the Wordpress database
  exec { 'create-database':
    unless  => '/usr/bin/mysql -u root -pvagrant wordpress',
    command => '/usr/bin/mysql -u root -pvagrant --execute="create database wordpress"',
    require => Class['mysql'],
  }

  exec { 'create-user':
    unless  => '/usr/bin/mysql -u wordpress -pwordpress wordpress',
    command => '/usr/bin/mysql -u root -pvagrant --execute="GRANT ALL PRIVILEGES ON wordpress.* TO \'wordpress\'@\'localhost\' IDENTIFIED BY \'wordpress\'"',
    require => [Class['mysql'], Exec['create-database'], ],
  }

  # Get a new copy of the latest wordpress release
  # FILE TO DOWNLOAD: http://wordpress.org/latest.tar.gz
  exec { 'download-wordpress':
    command => '/usr/bin/wget http://wordpress.org/latest.tar.gz',
    cwd     => '/vagrant/',
    creates => '/vagrant/latest.tar.gz'
  }

  exec { 'untar-wordpress':
    cwd     => '/vagrant/',
    command => '/bin/tar xzvf /vagrant/latest.tar.gz',
    require => Exec['download-wordpress'],
    creates => '/vagrant/wordpress',
  }

  # Import a MySQL database for a basic wordpress site.
  file { '/tmp/wordpress-db.sql':
    source => 'puppet:///modules/wordpress/wordpress-db.sql'
  }

  exec { 'load-db':
    command => '/usr/bin/mysql -u wordpress -pwordpress wordpress < /tmp/wordpress-db.sql && touch /home/vagrant/db-created',
    creates => '/home/vagrant/db-created',
    require => Class['mysql'],
  }

  # Copy a working wp-config.php file for the vagrant setup.
  file { '/vagrant/wordpress/wp-config.php':
    source => 'puppet:///modules/wordpress/wp-config.php',
    require => Exec['untar-wordpress'],
  }

  # Create the Wordpress Unit Tests database
  exec { 'create-tests-database':
    unless  => '/usr/bin/mysql -u root -pvagrant wp_tests',
    command => '/usr/bin/mysql -u root -pvagrant --execute="create database wp_tests"',
    require => Class['mysql'],
  }

  exec { 'create-tests-user':
    unless  => '/usr/bin/mysql -u wordpress -pwordpress',
    command => '/usr/bin/mysql -u root -pvagrant --execute="GRANT ALL PRIVILEGES ON wp_tests.* TO \'wordpress\'@\'localhost\' IDENTIFIED BY \'wordpress\'"',
    require => [Class['mysql'], Exec['create-tests-database'], ],
  }

  # Copy a working wp-tests-config.php file for the vagrant setup.
  file { '/vagrant/wordpress/wp-tests-config.php':
    source  => 'puppet:///modules/wordpress/wp-tests-config.php',
    require => Exec['untar-wordpress'],
  }
}

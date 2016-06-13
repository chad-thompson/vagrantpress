class tests::install {

  # Create the Wordpress test database
  exec { 'create-test-database':
    unless  => '/usr/bin/mysql -u root -pvagrant test',
    command => '/usr/bin/mysql -u root -pvagrant --execute=\'create database test;\'',
  }

  exec { 'create-test-user':
    unless  => '/usr/bin/mysql -u test -ptest test',
    command => '/usr/bin/mysql -u root -pvagrant --execute="CREATE USER \'test\'@\'localhost\' IDENTIFIED BY \'test\'; GRANT ALL PRIVILEGES ON test.* TO \'test\'@\'localhost\'"',
  }

  # Download the latest automated test suite
  # https://make.wordpress.org/core/handbook/testing/automated-testing/phpunit/

  exec { 'download-automated-testing-suite':
    command => 'svn co --force https://develop.svn.wordpress.org/trunk/ /vagrant/tests',
    creates => '/vagrant/tests',
  }

  # Copy a working wp-tests-config.php file for the vagrant setup.
  file { '/vagrant/tests/wp-tests-config.php':
    source  => 'puppet:///modules/tests/wp-tests-config.php',
    require => Exec['download-automated-testing-suite'],
  }

}

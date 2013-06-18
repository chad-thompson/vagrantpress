class wordpress::install{
  
  # Create the Wordpress database
  exec{"create-database":
    unless=>"/usr/bin/mysql -u root -pvagrant wordpress",
    command=>"/usr/bin/mysql -u root -pvagrant --execute=\"create database wordpress\"",
  }
  
  # Create a MySQL user for wordpress.
  exec{"create-user":
    unless=>"/usr/bin/mysql -u wordpress -pwordpress",
    command=>"/usr/bin/mysql -u root -pvagrant --execute=\"GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost' IDENTIFIED BY 'wordpress' \"",
  }
  
  # Get a new copy of the latest wordpress release

	# FILE TO DOWNLOAD: http://wordpress.org/latest.tar.gz


  
  exec{"git-wordpress": #tee hee
    command=>"/usr/bin/wget http://wordpress.org/latest.tar.gz",
    cwd=>"/vagrant/",
    creates=>"/vagrant/latest.tar.gz"
  }

  exec{"untar-wordpress":
    cwd     => "/vagrant/",
    command => "/bin/tar xzvf /vagrant/latest.tar.gz",
    require => Exec["git-wordpress"],
  }
  

  # Import a MySQL database for a basic wordpress site.
  file{
    "/tmp/wordpress-db.sql":
    source=>"puppet:///modules/wordpress/wordpress-db.sql"
  }
  
  exec{"load-db":
    command=>"/usr/bin/mysql -u wordpress -pwordpress wordpress < /tmp/wordpress-db.sql"
  }
  
  # Copy a working wp-config.php file for the vagrant setup.
  file{
    "/vagrant/wordpress/wp-config.php":
    source=>"puppet:///modules/wordpress/wp-config.php"
  }
  
}

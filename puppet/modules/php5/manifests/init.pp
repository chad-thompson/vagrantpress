class php5::install {

  package { "libapache2-mod-fastcgi": ensure => latest, }
  package { "php5-fpm": ensure => latest, }
  package { "php5": ensure => latest, }
  
  package { 'php5-cli': ensure => latest, }

  package { "php5-mysql": ensure => latest, }
  package { "php5-curl": ensure => latest, }
  package { "php5-gd": ensure => latest, }
  package { "php5-imagick": ensure => latest, }
  package { "php5-imap": ensure => latest, }


  exec { "a2enmod actions":
      command => "a2enmod actions",
      creates => '/etc/apache2/mods-enabled/actions.load',
      require => Package["apache2-mpm-worker"],
      notify  => Service["apache2"],
  }

  exec { "a2enmod fastcgi":
      command => "a2enmod fastcgi",
      creates => '/etc/apache2/mods-enabled/fastcgi.load',
      require => Package["apache2-mpm-worker"],
      notify  => Service["apache2"],
  }

  exec { "a2enmod alias":
      command => "a2enmod alias",
      creates => '/etc/apache2/mods-enabled/alias.load',
      require => Package["apache2-mpm-worker"],
      notify  => Service["apache2"],
  }

}

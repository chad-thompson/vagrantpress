class apache2::install{

  package { "apache2": ensure => present,}

  service { "apache2":
    ensure => running,
    require => Package["apache2"],
  }

  /*
    the httpd.conf change the user/group that apache uses to run its process
   */
  file { '/etc/apache2/conf.d/user':
    owner => root,
    group => root,
    ensure => file,
    mode => 644,
    source => '/vagrant/files/etc/apache2/httpd.conf',
    require => Package["apache2"],
    notify  => Service['apache2']
  }

  file { '/etc/apache2/sites-available/default':
    owner => root,
    group => root,
    ensure => file,
    mode => 644,
    source => '/vagrant/files/etc/apache2/sites-available/default',
    require => Package["apache2"],
    notify  => Service['apache2']
  }

  file { '/etc/apache2/mods-available/rewrite.load':
    owner => root,
    group => root,
    ensure => file,
    mode => 644,
    source => '/vagrant/files/etc/apache2/mods-available/rewrite.load',
    require => Package['apache2'],
    notify  => Service['apache2']
  }


  file { '/etc/apache2/sites-enabled/000-default':
    notify => Service["apache2"],
    ensure => link,
    target => "/etc/apache2/sites-available/default",
    require => Package["apache2"],
  }

  file { '/etc/apache2/mods-enabled/rewrite.load':
    notify => Service["apache2"],
    ensure => link,
    target => "/etc/apache2/mods-available/rewrite.load",
    require => Package["apache2"],
  }

}

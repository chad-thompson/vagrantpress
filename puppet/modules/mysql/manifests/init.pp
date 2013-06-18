class mysql::install {
  $password = "vagrant"
  package { "mysql-client": ensure => installed }
  package { "mysql-server": ensure => installed }

  exec { "Set MySQL server root password":
    subscribe => [ Package["mysql-server"], Package["mysql-client"] ],
    refreshonly => true,
    unless => "mysqladmin -uroot -p$password status",
    path => "/bin:/usr/bin",
    command => "mysqladmin -uroot password $password",
  }
}

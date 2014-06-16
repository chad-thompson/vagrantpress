#Install wp-cli

class wp_cli {


  package { 'wp_cli':
    require  => File['/tmp/php-wpcli_0.15.0_all.deb'],
    provider => dpkg,
    ensure => installed,
    source => "/tmp/php-wpcli_0.15.0_all.deb"
  }

}
class wpcli::install {

  exec { 'download-and-install-wpcli':
    command => 'curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && sudo mv wp-cli.phar /usr/local/bin/wp',
    creates => '/usr/local/bin/wp',
  }
}

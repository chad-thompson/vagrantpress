class php7::install {

  exec { "install_php7":
    command => "add-apt-repository ppa:ondrej/php -y && apt-get update -y && apt-get install php7.0 php7.0-mysql php7.0-curl php7.0-gd php7.0-fpm php7.0-dev php7.0-xdebug libapache2-mod-php7.0 php7.0-xdebug php7.0-mbstring -y && a2enmod proxy_fcgi setenvif && a2enconf php7.0-fpm && a2dismod php5 && a2enmod php7.0 && service apache2 restart",
    user => "root",
    require => Package['php5'],
    notify => Service['apache2'],
  }

}

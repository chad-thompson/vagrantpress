class php5::install{
  package{"php5": ensure=>present,}
  package{"php5-mysql": ensure=>present,}
  package{"php5-curl": ensure=>present,}
  package{"php5-gd": ensure=>present,}
  package{"php5-fpm": ensure=>present,}
  package{"libapache2-mod-php5": ensure=>present,}
}

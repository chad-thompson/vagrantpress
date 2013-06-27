class wordpress::create {

  # use wp cli to install a wordpress version
  # -----------------------------------------
  # wp core download --version=3.5.1 --path="wptest.wp"
  # cd wptest.wp
  # wptest$ wp core config --dbname="wptest" --dbuser="root" --dbpass="vagrant" --dbhost="localhost"
  # wp db create
  # wp core install --url="http://wptest.wp" --title="WPTest" --admin_name="vagrant" --admin_password="vagrant" --admin_email="vagrant@vagrant"


  $install_path = '/shared_projects'
  $version = '3.5.2'
  $wpname = 'wptest' # .wp

  # download version
  exec { "wp core download ${wpname}":
    cwd => $install_path,
    command => "wp core download --version='${version}' --path='${wpname}.wp'",
    unless => "test -d ${install_path}/${wpname}.wp",
    require => File["/usr/bin/wp"],
  }

  # config 
  exec { "wp core config ${wpname}":
    refreshonly => true,
    subscribe => Exec["wp core download ${wpname}"],
    cwd => "${install_path}/${wpname}.wp",
    command => "wp core config --dbname='${wpname}' --dbuser='root' --dbpass='vagrant' --dbhost='localhost'",
    onlyif => "test -d ${install_path}/${wpname}.wp",
    require => [File["/usr/bin/wp"]],
  }

  # create database 
  exec { "wp db create ${wpname}":
    refreshonly => true,
    subscribe => Exec["wp core config ${wpname}"],
    cwd => "${install_path}/${wpname}.wp",
    command => "wp db create",
    onlyif => "test -d ${install_path}/${wpname}.wp",
    require => [File["/usr/bin/wp"]],
  }

  # install wordpress
  exec { "wp core install ${wpname}":
    refreshonly => true,
    subscribe => Exec["wp db create ${wpname}"],
    cwd => "${install_path}/${wpname}.wp",
    command => "wp core install --url='http://${wpname}.wp' --title='${wpname}' --admin_name='vagrant' --admin_password='vagrant' --admin_email='vagrant@vagrant'",
    onlyif => "test -d ${install_path}/${wpname}.wp",
    require => [File["/usr/bin/wp"]],
  }

}
class wpcli::install{
  
  # copy & paste from ...
  # https://github.com/rmccue/puppet-wp/blob/master/manifests/cli.pp

  $install_path = '/usr/local/src/wp-cli'
  $version = 'dev-master'

  # Create the install path
  file { "$install_path":
    ensure => directory,
  }

  # Clone the Git repo
  exec{ 'wp-cli download':
    command => "/usr/bin/curl http://wp-cli.org/installer.sh -o $install_path/installer.sh",
    require => [ Package[ 'curl' ], File[ $install_path ] ],
    creates => "$install_path/installer.sh",
  }

  # Ensure we can run the installer
  file { "$install_path/installer.sh":
    ensure => "present",
    mode => "u+x"
  }

  # Install wp-cli
  exec { "wp-cli install":
    command => "/usr/bin/yes | $install_path/installer.sh",
    environment => [
      "VERSION=$version",
      "INSTALL_DIR=$install_path"
    ],
    require => [
      File[ "$install_path/installer.sh" ],
      Package[ 'curl' ],
      Package[ 'php5-cli' ],
      Package[ 'git' ]
    ],
    creates => "$install_path/bin/wp"
  }

  # Ensure we can run wp-cli
  file { "$install_path/bin/wp":
    ensure => "present",
    mode => "a+x",
    require => Exec[ 'wp-cli install' ]
  }

  # Symlink it across
  file { '/usr/bin/wp':
    ensure => link,
    target => "$install_path/bin/wp",
    require => File[ "$install_path/bin/wp" ],
  }

}

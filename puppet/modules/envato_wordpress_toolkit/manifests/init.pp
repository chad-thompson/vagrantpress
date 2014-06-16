# Install https://github.com/envato/envato-wordpress-toolkit
class envato_wordpress_toolkit {

  require git
  require wordpress

  $plugins_directory = '/vagrant/wordpress/wp-content/plugins'
  $plugin_name = 'envato-wordpress-toolkit'
  $plugin_repository = "https://github.com/envato/${plugin_name}.git"

  exec { "clone-${plugin_name}":
    creates => "${plugins_directory}/${plugin_name}",
    require => [Package['git'], Exec['untar-wordpress'], ],
    cwd     => $plugins_directory,
    command => "/usr/bin/git clone ${plugin_repository}",
  }
}

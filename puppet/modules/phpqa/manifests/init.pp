#Install the PHP Quality Assurance Toolchain

class phpqa::install{
	exec {"pear install phpunit":
	  command => "/usr/bin/pear install --alldeps pear.phpunit.de/PHPUnit",
	  creates => '/usr/bin/phpunit',
	  require => Exec['pear update-channels']
	}
	
	# install phploc
	exec {"pear install phploc":
	  command => "/usr/bin/pear install --alldeps pear.phpunit.de/phploc",
	  creates => '/usr/bin/phploc',
	  require => Exec['pear update-channels']
	}
	
	# install phpcpd
	exec {"pear install phpcpd":
	  command => "/usr/bin/pear install --alldeps pear.phpunit.de/phpcpd",
	  creates => '/usr/bin/phpcpd',
	  require => Exec['pear update-channels']
	}
	
	# install phpdcd
	exec {"pear install phpdcd":
	  command => "/usr/bin/pear install --alldeps pear.phpunit.de/phpdcd-beta",
	  creates => '/usr/bin/phpdcd',
	  require => Exec['pear update-channels']
	}
	
	# install phpcs
	exec {"pear install phpcs":
	  command => "/usr/bin/pear install --alldeps PHP_CodeSniffer",
	  creates => '/usr/bin/phpcs',
	  require => Exec['pear update-channels']
	}
	
	# install WordPress Coding Standard sniffs
	# http:////github.com/WordPress-Coding-Standards/WordPress-Coding-Standards
	exec { "Install WP phpcs sniffs":
		command => "/usr/bin/git clone git://github.com/WordPress-Coding-Standards/WordPress-Coding-Standards.git $(pear config-get php_dir)/PHP/CodeSniffer/Standards/WordPress",
		require => Exec['pear update-channels', 'pear install phpcs']
	}
	
	# install phpdepend
	exec {"pear install pdepend":
	  command => "/usr/bin/pear install --alldeps pear.pdepend.org/PHP_Depend-beta",
	  creates => '/usr/bin/pdepend',
	  require => Exec['pear update-channels']
	}
	
	# install phpmd
	exec {"pear install phpmd":
	  command => "/usr/bin/pear install --alldeps pear.phpmd.org/PHP_PMD",
	  creates => '/usr/bin/phpmd',
	  require => Exec['pear update-channels']
	}
	
	# install PHP_CodeBrowser
	exec {"pear install PHP_CodeBrowser":
	  command => "/usr/bin/pear install --alldeps pear.phpunit.de/PHP_CodeBrowser",
	  creates => '/usr/bin/phpcb',
	  require => Exec['pear update-channels']
	}
}

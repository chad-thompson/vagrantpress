# VagrantPress

*VagrantPress* is a packaged development environment for developing WordPress themes and modules.
I initially created this project to aid in developing child modules for a WordPress blog.

# What's Installed

+ Ubuntu Precise (12.04)
+ WordPress 3.9.1 running Twenty Twelve theme.
+ WordPress Toolkit for Envato Marketplace hosted items
+ Mysql
+ Php
+ Phpmyadmin
+ Subversion
+ PEAR
+ Xdebug
+ PHPUnit
+ phploc
+ phpcpd
+ phpdcd
+ phpcs
+ phpdepend
+ phpmd
+ PHP_CodeBrowser
+ WordPress sniffs for phpcs
+ WordPress Unit Tests

## Getting Started

This is a fairly simple project to get up and running.
The procedure for starting up a working WordPress is as follows:

1. Clone the project.  (There’s only master branch.)
2. Run the command `vagrant up`
3. Open your browser to http://localhost:8080

## Working with the environment

To log in to the local WordPress installation:

`http://localhost:8080/wp-admin/` the username is `admin`, the password is `vagrant`.

You can access phpMyAdmin:

`http://localhost:8080/phpmyadmin/` with username `wordpress`, password `wordpress`.

## A Few Details

* If you're needing a password (for anything - including mysql, it should be `vagrant`)

## Getting Help

Feel free to file an issue, create a pull request, or contact me at [my website][chadthompson].

[chadthompson]: http://chadthompson.me

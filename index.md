---
layout: page
title: Say Hello to Vagrantpress
---
{% include JB/setup %}


  **Vagrantpress** is a [Vagrant][] based development enviroment for creating and modifying [WordPress][] sites.  
  
  Using Vagrantpress is meant to be easy - you should be able to get started with four commands:

  <div style="width:100%; padding: 5px; display:block; background-color:#073642;">
  <code style="color:#93a1a1; background-color: inherit;">$ wget https://github.com/chad-thompson/vagrantpress/archive/master.zip </code>
  <code style="color:#93a1a1; background-color: inherit;">$ unzip vagrantpress-master.zip</code>  <br/>
  <code style="color:#93a1a1; background-color: inherit;">$ cd vagrantpress-master</code><br/>
  <code style="color:#93a1a1; background-color: inherit;">$ vagrant up</code>
  </div>


  Once vagrant builds the environment, you'll have a clean development 
  environment for creating your own WordPress modules and themes by opening `http://localhost:8080/`.


###What Do I Need to Get Started?

**First**, you'll need a copy of a Virtual Machine environment.  Install a copy of [Oracle VirtualBox][virtualbox], the only currently supported VM environment for Vagrant.

**Second**, you'll need a working copy of [Vagrant][].  You can find a copy of the latest version [on the Vagrant downloads page][vagrantdownloads], or follow directions in the [Vagrant documentation][vagrantdocumentation] to install vagrant for your environment.

**... and that's it.**  From here, you can follow the four-command script above or get your own copy of Vagrantpress [from the github repository][vpgithub].  Vagrantpress uses [Puppet] scripting to set up a working Wordpress installation.

**NOTE: ** you can log in to the Wordpress admin panel at `http://localhost:8080/wp-admin/` with the username `admin` and the password `vagrant`.


###What Does VagrantPress Install?

The Vagrantpress [puppet scripts][puppetlabs] will install a simple LAMP stack and clone a copy of the [WordPress github repository][wordpress-git] to the virtual machine shared folder.

**WARNING**:  The default puppet script will attempt to download a copy of a Vagrant 'box' from Amazon S3 that is approximately 500 MB in size.  Feel free to use this box, or if you have one locally, edit the `Vagrantfile` in the root directory to use a local (or easily obtained) box.  (See the [documentation][vagrantdocumentation] for more on Vagrant boxes.)

The LAMP stack here (as tested) includes:

* A virtual machine running the 12.04 LTS (32-bit) version of [Ubuntu][].
* [The Apache2 WebServer][apache2]
* [PHP5][php]
* [The MySQL Database][mysql]
* [WordPress][] v. 3.5  (With the git clone command, you'll have access to all tagged releases of WordPress, but the puppet script currently creates a database appropriate for v. 3.5.  Earlier versions have not been tested at this writing.)

### Now That It's Up and Running, Now What?

You can use this environemnt to create, modify and experiment with Wordpress themeing and modules - either your own development or testing plugins for use on your 'real' Wordpress site.

The Vagrantpress puppet script creates a folder called `WordPress` in the directory where the Vagrant virtual machine is running - you can create your own themes and modules in the `wp-content` directory as you would for any other type of Wordpress development.  This directory will also exist "on the host system", allowing you to use the development tools/editors of your choice.

  
[vagrant]: http://vagrantup.com
[vagrantdownloads]: http://downloads.vagrantup.com/
[vagrantdocumentation]: http://docs.vagrantup.com/v1/docs/index.html
[virtualbox]: http://virtualbox.org
[virtualboxdownloads]: https://www.virtualbox.org/wiki/Downloads
[vpgithub]: https://github.com/chad-thompson/vagrantpress
  
  [puppetlabs]: http://puppetlabs.org
  [apache2]: http://httpd.apache.org
  [php]: http://php.net
  [mysql]: http://mysql.org
  [ubuntu]: http://ubuntu.org
  [wordpress]: http://wordpress.org
  [wordpress-git]: http://github.org/wordpress/wordpress
  


###Authors and Contributors

Vagrantpress is a personal project of  <a href="http://chadthompson.me" class="user-mention">@chad-thompson</a> who was looking for a simpler way to 
  stand up multiple Wordpress environments.  This project is one of the first
  'real' Vagrant environments (and puppet scripts) that I've put together, but
  I hope that someone else finds this as useful as I do.  Please contact me if you've found this tool useful, have some questions, or would like to help out.  Thanks!


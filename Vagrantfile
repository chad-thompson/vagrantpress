# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "trusty64"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  # fix "==> default: stdin: is not a tty" error message
  config.vm.provision "fix-no-tty", type: "shell" do |s|
    s.privileged = false
    s.inline = "sudo grep -q 'tty -s && mesg' /root/.profile || \\
                    sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile"
  end

  # allows running commands globally in shell for installed composer libraries
  config.vm.provision :shell, path: "files/scripts/setup.sh"

  # setup virtual hostname and provision local IP
  config.vm.hostname = "vagrantpress.dev"
  config.vm.network :private_network, :ip => "192.168.50.4"

  # add virtual hostname to /etc/hosts
  if Vagrant.has_plugin?('HostsUpdater')
    config.hostsupdater.aliases = %w{www.vagrantpress.dev}
    config.hostsupdater.remove_on_suspend = true
  elsif Vagrant.has_plugin?('HostManager')
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    config.hostmanager.manage_guest = true
    config.hostmanager.ignore_private_ip = false
    config.hostmanager.include_offline = true
    config.hostmanager.aliases = %w{www.vagrantpress.dev}
  else
    raise "Vagrantpress requires vagrant-hostsupdater or vagrant-hostmanager plugin"
  end

   config.vm.provision :shell do |shell|
      shell.inline = "
        mkdir -p /etc/puppet/modules;
        puppet module install puppetlabs-stdlib --version 4.11.0 --force;
      "
    end

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path = "puppet/modules"
    puppet.manifest_file  = "init.pp"
    puppet.options="--verbose --debug"
  end

  # Fix for slow external network connections
  config.vm.provider :virtualbox do |vb|
    vb.memory = 2048
    vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
    vb.customize ['modifyvm', :id, '--natdnsproxy1', 'on']
  end
end

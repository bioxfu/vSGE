# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "ubuntu/xenial64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL

  # VirtualBox, common settings
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 2048
    vb.cpus = 2
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"] # fixes slow dns lookups
  end

  config.vm.define "master" do |srv|
    srv.vm.hostname = "master"
    srv.vm.network :private_network, ip: "192.168.9.10"
    srv.vm.provider "virtualbox" do |vb| vb.name = "SGE-Master"; end
    srv.vm.provision "shell", path: "install_master.sh"
    srv.vm.provision "shell", path: "config_master.sh"
  end

  config.vm.define "worker1" do |srv|
    srv.vm.hostname = "worker1"
    srv.vm.network :private_network, ip: "192.168.9.11"
    srv.vm.provider "virtualbox" do |vb| vb.name = "SGE-Worker1"; end
    srv.vm.provision "shell", path: "install_worker.sh"
  end

  config.vm.define "worker2" do |srv|
    srv.vm.hostname = "worker2"
    srv.vm.network :private_network, ip: "192.168.9.12"
    srv.vm.provider "virtualbox" do |vb| vb.name = "SGE-Worker2"; end
    srv.vm.provision "shell", path: "install_worker.sh"
  end

  config.vm.define "worker3" do |srv|
    srv.vm.hostname = "worker3"
    srv.vm.network :private_network, ip: "192.168.9.13"
    srv.vm.provider "virtualbox" do |vb| vb.name = "SGE-Worker3"; end
    srv.vm.provision "shell", path: "install_worker.sh"
  end

  config.vm.define "worker4" do |srv|
    srv.vm.hostname = "worker4"
    srv.vm.network :private_network, ip: "192.168.9.14"
    srv.vm.provider "virtualbox" do |vb| vb.name = "SGE-Worker4"; end
    srv.vm.provision "shell", path: "install_worker.sh"
  end

  config.vm.define "worker5" do |srv|
    srv.vm.hostname = "worker5"
    srv.vm.network :private_network, ip: "192.168.9.15"
    srv.vm.provider "virtualbox" do |vb| vb.name = "SGE-Worker5"; end
    srv.vm.provision "shell", path: "install_worker.sh"
  end

end

# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "bento/centos-7.2"
  config.ssh.forward_agent = true
  config.vm.provision :shell, path: "run-docker.sh"
  config.vm.provision :shell, path: "set-hosts.sh"

  SWARM_MANAGER_ADDRESS = "192.168.33.10"

  config.vm.define :manager do |host|
    _HOSTNAME = "manager"
    _PRIVATE_IP_ADDRESS = SWARM_MANAGER_ADDRESS

    host.vm.hostname = _HOSTNAME
    host.vm.network "private_network", ip: _PRIVATE_IP_ADDRESS
  end

  config.vm.define :node01 do |host|
    _HOSTNAME = "node01"
    _PRIVATE_IP_ADDRESS = "192.168.33.20"

    host.vm.hostname = _HOSTNAME
    host.vm.network "private_network", ip: _PRIVATE_IP_ADDRESS
  end

  config.vm.define :node02 do |host|
    _HOSTNAME = "node02"
    _PRIVATE_IP_ADDRESS = "192.168.33.30"

    host.vm.hostname = _HOSTNAME
    host.vm.network "private_network", ip: _PRIVATE_IP_ADDRESS
  end

end

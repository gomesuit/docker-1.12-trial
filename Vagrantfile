# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
NODE_COUNT = 2

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "bento/centos-7.2"
  config.ssh.forward_agent = true
  config.vm.provision :shell, path: "run-docker.sh"

  SWARM_MANAGER_ADDRESS = "192.168.33.10"

  config.vm.define :manager do |host|
    _HOSTNAME = "manager"
    _PRIVATE_IP_ADDRESS = SWARM_MANAGER_ADDRESS

    host.vm.hostname = _HOSTNAME
    host.vm.network "private_network", ip: _PRIVATE_IP_ADDRESS
    host.vm.provision :shell, path: "run-manager.sh"
  end

  (1..NODE_COUNT).each do |i|
    config.vm.define "node#{i}" do |subconfig|
      subconfig.vm.hostname = "node#{i}"
      subconfig.vm.network "private_network", ip: "192.168.33.1#{i}"
      subconfig.vm.provision "shell" do |s|
        s.path = "run-node.sh"
        s.args = SWARM_MANAGER_ADDRESS
      end
    end
  end
end


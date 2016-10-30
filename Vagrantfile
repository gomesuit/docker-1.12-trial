# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<SCRIPT
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
systemctl restart sshd
ifdown eth1
ifup eth1
SCRIPT

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.box = "centos/7"
  config.ssh.insert_key = false
  config.vm.provision :shell, inline: $script

  SWARM_MANAGER_ADDRESS = "192.168.33.10"

  config.vm.define :manager do |host|
    _HOSTNAME = "manager"
    _PRIVATE_IP_ADDRESS = SWARM_MANAGER_ADDRESS

    host.vm.hostname = _HOSTNAME
    host.vm.network "private_network", ip: _PRIVATE_IP_ADDRESS
    host.vm.provision :shell, path: "stop-security.sh"
    host.vm.provision :shell, path: "run-docker.sh"
    host.vm.provision :shell, path: "set-hosts.sh"
  end

  config.vm.define :node01 do |host|
    _HOSTNAME = "node01"
    _PRIVATE_IP_ADDRESS = "192.168.33.20"

    host.vm.hostname = _HOSTNAME
    host.vm.network "private_network", ip: _PRIVATE_IP_ADDRESS
    host.vm.provision :shell, path: "stop-security.sh"
    host.vm.provision :shell, path: "run-docker.sh"
    host.vm.provision :shell, path: "set-hosts.sh"
  end

  config.vm.define :node02 do |host|
    _HOSTNAME = "node02"
    _PRIVATE_IP_ADDRESS = "192.168.33.30"

    host.vm.hostname = _HOSTNAME
    host.vm.network "private_network", ip: _PRIVATE_IP_ADDRESS
    host.vm.provision :shell, path: "stop-security.sh"
    host.vm.provision :shell, path: "run-docker.sh"
    host.vm.provision :shell, path: "set-hosts.sh"
  end

end

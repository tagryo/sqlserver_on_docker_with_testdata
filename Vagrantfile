# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  Encoding.default_external = 'UTF-8'
  config.vm.box = "centos/7"
  # config.vbguest.auto_update = false
  config.vm.network "forwarded_port", guest: 1433, host: 1433
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.synced_folder ".", "/vagrant", type:nil
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "5120"
  end
  config.vm.provision "shell", inline: <<-SHELL
    yum update -y
    yum install -y yum-utils device-mapper-persistent-data lvm2
    yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
    yum install -y docker-ce
    yum install -y docker-ce-17.06.2.ce
    systemctl enable docker.service
    systemctl start docker.service
    echo  net.ipv4.ip_forward=1 >> /etc/sysctl.conf && sysctl -p
  SHELL
end

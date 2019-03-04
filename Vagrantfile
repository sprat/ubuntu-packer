# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.define "ubuntu-server" do |target|
    target.vm.box = "builds/ubuntu-server_virtualbox.box"
    target.vm.provider "virtualbox" do |vbox|
      vbox.default_nic_type = "virtio"
      vbox.cpus = 1
      vbox.memory = 1024
      vbox.gui = true
    end
  end

  config.vm.define "xubuntu" do |target|
    target.vm.box = "builds/xubuntu_virtualbox.box"
    target.vm.provider "virtualbox" do |vbox|
      vbox.default_nic_type = "virtio"
      vbox.cpus = 2
      vbox.memory = 2048
      vbox.gui = true
    end
  end
end

# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.define "server" do |target|
    target.vm.box = "./boxes/ubuntu-server-20.04_virtualbox.box"
  end

  config.vm.define "xubuntu" do |target|
    target.vm.box = "./boxes/xubuntu-20.04_virtualbox.box"
  end
end

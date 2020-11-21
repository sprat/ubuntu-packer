# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.define "focal-server" do |target|
    target.vm.box = "builds/ubuntu-20.04_virtualbox.box"
  end

  config.vm.define "focal-xubuntu" do |target|
    target.vm.box = "builds/xubuntu-20.04_virtualbox.box"
  end
end

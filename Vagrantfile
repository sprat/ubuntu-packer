# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.define "focal-server" do |target|
    target.vm.box = "builds/focal-server_virtualbox.box"
  end

  config.vm.define "focal-xubuntu" do |target|
    target.vm.box = "builds/focal-xubuntu_virtualbox.box"
  end
end

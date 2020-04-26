#!/usr/bin/env bash
set -eu
ARCH=$(dpkg --print-architecture)

# make sure we run the installation script as root
if [[ $(id -u) -ne 0 ]]; then
  echo "Please run as root"
  exit
fi

# add the apt repo & key
wget -qO- https://vagrant-deb.linestarve.com/vagrant-deb.asc | apt-key add - >/dev/null 2>&1
echo "deb [arch=${ARCH}] https://vagrant-deb.linestarve.com/ any main" >/etc/apt/sources.list.d/vagrant.list

# install
apt-get update -qq
apt-get install -y vagrant

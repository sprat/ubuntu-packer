#!/usr/bin/env bash
set -eu
VIRTUALBOX_MILESTONE="6.1"
KERNEL=$(uname -r)
DIST=$(lsb_release -cs)
ARCH=$(dpkg --print-architecture)

# make sure we run the installation script as root
if [[ $(id -u) -ne 0 ]]; then
  echo "Please run as root"
  exit
fi

# add the apt repo & key
wget -qO- https://www.virtualbox.org/download/oracle_vbox_2016.asc | apt-key add -
echo "deb [arch=${ARCH}] https://download.virtualbox.org/virtualbox/debian ${DIST} contrib" >/etc/apt/sources.list.d/virtualbox.list

# install
apt-get update -qq
apt-get install -y "linux-headers-${KERNEL}"
apt-get install -y "virtualbox-${VIRTUALBOX_MILESTONE}"

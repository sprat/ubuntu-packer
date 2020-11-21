#!/usr/bin/env bash
set -eu
DIST=$(lsb_release -cs)
ARCH=$(dpkg --print-architecture)

# make sure we run the installation script as root
if [[ $(id -u) -ne 0 ]]; then
  echo "Please run as root"
  exit
fi

# add the apt repo & key
wget -qO- https://apt.releases.hashicorp.com/gpg | apt-key add -
echo "deb [arch=${ARCH}] https://apt.releases.hashicorp.com ${DIST} main" >/etc/apt/sources.list.d/hashicorp.list

# install
apt-get update -qq
apt-get install -y "vagrant packer"

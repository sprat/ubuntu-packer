#!/usr/bin/env bash
set -eu
VAGRANT_VERSION="2.2.14"
VAGRANT_DOWNLOAD_URL="https://releases.hashicorp.com/vagrant/${VAGRANT_VERSION}/vagrant_${VAGRANT_VERSION}_x86_64.deb"

# make sure we run the installation script as root
if [[ $(id -u) -ne 0 ]]; then
  echo "Please run as root"
  exit
fi

wget -qO vagrant.deb ${VAGRANT_DOWNLOAD_URL}
apt-get install -y vagrant.deb
rm vagrant.deb

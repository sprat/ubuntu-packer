#!/usr/bin/env bash
set -eu
PACKER_VERSION="1.6.5"
PACKER_DOWNLOAD_URL="https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip"

# make sure we run the installation script as root
if [[ $(id -u) -ne 0 ]]; then
  echo "Please run as root"
  exit
fi

wget -qO packer.zip ${PACKER_DOWNLOAD_URL}
unzip -o packer.zip -d /usr/local/bin
rm packer.zip

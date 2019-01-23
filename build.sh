#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 name"
    echo "where name: ubuntu-server, xubuntu, ..."
    exit 1
fi

UBUNTU_ISO_DATE=$(date -u +%Y%m%d)
UBUNTU_ISO_FILENAME="bionic-server-amd64.iso"
UBUNTU_ISO_BASE_URL="http://cdimage.ubuntu.com/ubuntu-server/bionic/daily/$UBUNTU_ISO_DATE/"

# UBUNTU_ISO_FILENAME="ubuntu-18.04.1-server-amd64.iso"
# UBUNTU_ISO_BASE_URL="http://cdimage.ubuntu.com/releases/18.04.1/release/"

packer build -var ubuntu_iso_filename=$UBUNTU_ISO_FILENAME -var ubuntu_iso_base_url=$UBUNTU_ISO_BASE_URL -var-file=packer/$1.json packer/template.json

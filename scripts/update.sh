#!/bin/bash
set -eux
apt-get update
apt-get -y dist-upgrade
apt-get -y autoremove --purge
apt-get -y clean
reboot

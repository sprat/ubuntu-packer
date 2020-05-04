#!/bin/bash
set -eux
export DEBIAN_FRONTEND=noninteractive

# allow password-less sudo for the vagrant user
echo 'vagrant ALL=(ALL) NOPASSWD:ALL' >/etc/sudoers.d/99_vagrant
chmod 440 /etc/sudoers.d/99_vagrant

# optimize grub
echo 'GRUB_TERMINAL=console' >/etc/default/grub.d/console.cfg
update-grub

# disable automatic updates/upgrades
echo 'APT::Periodic::Enable "0";' >/etc/apt/apt.conf.d/99no-periodic-updates
chmod 644 /etc/apt/apt.conf.d/99no-periodic-updates

# remove unused packages
apt-get -y --purge autoremove

# clear the apt cache
apt-get -y clean

# get a new machine ID generated on first boot
truncate -s 0 /etc/machine-id

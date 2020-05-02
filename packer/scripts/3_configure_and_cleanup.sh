#!/bin/bash
set -eux
export DEBIAN_FRONTEND=noninteractive

# optimize grub
echo 'GRUB_TERMINAL=console' >/etc/default/grub.d/console.cfg
update-grub

# disable automatic updates/upgrades
echo 'APT::Periodic::Enable "0";' >/etc/apt/apt.conf.d/99no-periodic-updates
chmod 644 /etc/apt/apt.conf.d/99no-periodic-updates

# Remove unused packages
apt-get -y --purge autoremove

# Clear the apt cache
apt-get -y clean

# Get a new machine ID generated on first boot
truncate -s 0 /etc/machine-id

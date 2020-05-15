#!/bin/bash
set -eux
export DEBIAN_FRONTEND=noninteractive

# configure ssh access
mkdir -m 700 /home/vagrant/.ssh
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key' >/home/vagrant/.ssh/authorized_keys
chmod 600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh
# TODO: disable password auth
#PasswordAuthentication yes

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

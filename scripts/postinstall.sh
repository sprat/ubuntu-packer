#!/bin/bash
set -eux

# Allow password-less sudo for vagrant user
echo "vagrant ALL=(ALL) NOPASSWD:ALL" >/etc/sudoers.d/99_vagrant
chmod 440 /etc/sudoers.d/99_vagrant

# Add vagrant insecure SSH public key
SSH_DIR=/home/vagrant/.ssh
mkdir -p $SSH_DIR
wget -q https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub -O $SSH_DIR/authorized_keys
chown -R vagrant:vagrant $SSH_DIR
chmod 700 $SSH_DIR
chmod 600 $SSH_DIR/authorized_keys

# Disable password authentication in SSH server for security purpose
sed -i 's/[#]*PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config

# Disable APT periodic updates
echo "APT::Periodic::Enable \"0\";" >/etc/apt/apt.conf.d/99no-periodic-updates

# Get a new machine ID generated on first boot
truncate -s 0 /etc/machine-id

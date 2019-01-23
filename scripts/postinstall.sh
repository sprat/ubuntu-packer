#!/bin/bash
# allow password-less sudo for vagrant user
echo "vagrant ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/99_vagrant
chmod 440 /etc/sudoers.d/99_vagrant

# add vagrant insecure public key to vagrant's SSH authorized keys
SSH_DIR=/home/vagrant/.ssh
mkdir -p $SSH_DIR
wget -q https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub -O $SSH_DIR/authorized_keys
chown -R vagrant:vagrant $SSH_DIR
chmod 700 $SSH_DIR
chmod 600 $SSH_DIR/authorized_keys

# disable password authentication in SSH server for security purpose (vagrant's password is public)
sed -i 's/[#]*PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config

# get a new (unique) machine ID generated on first boot
truncate -s 0 /etc/machine-id

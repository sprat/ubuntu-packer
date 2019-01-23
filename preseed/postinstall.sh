#!/bin/bash
# password-less sudo for vagrant user
echo "vagrant ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/99_vagrant
chmod 440 /etc/sudoers.d/99_vagrant

# add vagrant insecure public key to ssh authorized keys
SSH_DIR=/home/vagrant/.ssh
mkdir -p $SSH_DIR
wget https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub -O $SSH_DIR/authorized_keys
chown -R vagrant:vagrant $SSH_DIR
chmod 700 $SSH_DIR
chmod 600 $SSH_DIR/authorized_keys

# TODO: Disable password authentication in SSH config?
# TODO: UseDNS: no in SSH config?
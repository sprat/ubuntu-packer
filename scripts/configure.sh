#!/bin/bash
set -eux

# Allow password-less sudo for vagrant user
echo "vagrant ALL=(ALL) NOPASSWD:ALL" >/etc/sudoers.d/99_vagrant
chmod 440 /etc/sudoers.d/99_vagrant

# Add vagrant insecure SSH public key
SSH_DIR=/home/vagrant/.ssh
mkdir -p $SSH_DIR
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key' > $SSH_DIR/authorized_keys
chown -R vagrant:vagrant $SSH_DIR
chmod 700 $SSH_DIR
chmod 600 $SSH_DIR/authorized_keys

# Disable password authentication in SSH server for security purpose
sed -i 's/[#]*PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config

# Get a new machine ID generated on first boot
truncate -s 0 /etc/machine-id

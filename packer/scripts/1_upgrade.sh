#!/bin/bash
set -eux
export DEBIAN_FRONTEND=noninteractive

# perform upgrade
apt-get update
apt-get -y dist-upgrade

# reboot in case there's an upgrade requiring a reboot
if [[ -f /var/run/reboot-required ]]; then
    reboot
fi

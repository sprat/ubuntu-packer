#!/bin/bash
set -eux
export DEBIAN_FRONTEND=noninteractive
VIRTUALBOX_GUEST_ADDITIONS_ISO=/home/vagrant/VBoxGuestAdditions.iso
BUILD_PACKAGES="gcc make"

if [[ -f "$VIRTUALBOX_GUEST_ADDITIONS_ISO" ]]; then
    # mount guest additions ISO
    mount -o ro,loop $VIRTUALBOX_GUEST_ADDITIONS_ISO /mnt

    # install build packages
    apt-get update
    apt-get -y install $BUILD_PACKAGES

    # install the guest additions
    pushd /mnt >/dev/null
    # ignore exit code 2: it indicates that a reboot is required to load the new drivers
    sh ./VBoxLinuxAdditions.run || [[ $? -eq 2 ]]
    popd >/dev/null

    # unmount and delete guest additions ISO
    umount /mnt
    rm $VIRTUALBOX_GUEST_ADDITIONS_ISO

    # make sure we load the new drivers
    reboot
fi

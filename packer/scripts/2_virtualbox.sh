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
    INSTALL_EXIT_CODE=0
    sh ./VBoxLinuxAdditions.run || INSTALL_EXIT_CODE=$?
    popd >/dev/null

    # unmount and delete guest additions ISO
    umount /mnt
    rm $VIRTUALBOX_GUEST_ADDITIONS_ISO

    # exit code 2 means that a reboot is required to load the new drivers
    if [[ $INSTALL_EXIT_CODE -eq 2 ]]; then
        reboot
    fi
    # ... or exit with the proper exit code (hopefully 0)
    exit $INSTALL_EXIT_CODE
fi

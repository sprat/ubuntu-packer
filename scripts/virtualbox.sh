#!/bin/bash
set -eux

VIRTUALBOX_GUEST_ADDITIONS_ISO=~/VBoxGuestAdditions.iso
PACKAGES="gcc make"

if [[ -f "$VIRTUALBOX_GUEST_ADDITIONS_ISO" ]]; then
    mount -o ro,loop $VIRTUALBOX_GUEST_ADDITIONS_ISO /mnt
    apt-get install -y $PACKAGES
    pushd /mnt >/dev/null
    # ignore exit code 2: it indicates that a reboot is required to use the new drivers
    sh ./VBoxLinuxAdditions.run || [[ $? -eq 2 ]]
    popd >/dev/null
    apt-get autoremove -y --purge $PACKAGES
    umount /mnt
    rm $VIRTUALBOX_GUEST_ADDITIONS_ISO
    reboot
fi

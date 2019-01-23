# ubuntu-packer

This project is about building base Ubuntu boxes to be used with
[Vagrant](https://www.vagrantup.com/).

Compared to other Ubuntu base boxes, we tried to keep the installation as
vanilla/standard as possible, so that the images ressemble a typical manual
install from a CD image on a recent machine using the default values from the
installer.

However, there are still some differences that can't be avoided:
- Vagrant needs to connect to our machines remotely, so an OpenSSH server is
  installed in the boxes. Since the vagrant user's password is publicly
  disclosed, in order to be secure, the SSH password authentication is disabled.
- The vagrant user has password-less sudo to facilitate Vagrant usage
- We used a VM-optimized kernel (`linux-image-virtual`) to avoid installing
  many useless drivers and to keep the box size relatively small
- The VirtualBox Guest additions are installed for best virtualization support.
  Note that they are installed via apt, so they can be upgraded easily.
- A LVM filesystem is used instead of the legacy one so that the VM hard disks
  can be easily resized.
- Since the desktop live CD installation can't be easily automated, we start
  from a server CD image to create the desktop boxes. Note that it does not mean
  we install the "server" packages, but you may still find some packages that
  shouldn't be present on a typical desktop install, e.g. `tasksel`.

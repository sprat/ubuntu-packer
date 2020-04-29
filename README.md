# ubuntu-packer

This project is about building base Ubuntu boxes to be used with
[Vagrant](https://www.vagrantup.com/).

Compared to other Ubuntu base boxes, we tried to keep the installation as
vanilla/standard as possible, so that the images resemble a typical manual
install from a CD image on a recent machine using the default values from the
installer.

However, there are still some differences that can't be avoided:
- Vagrant needs to connect to our machines remotely, so an OpenSSH server is
  installed in the boxes. Since the `vagrant` user's password is public, in
  order to be secure, the SSH password authentication is disabled. Note that
  the `vagrant` user's private SSH key is also public but it is replaced by
  default by Vagrant.
- The `vagrant` user has password-less sudo to facilitate vagrant usage
- The VirtualBox Guest additions are installed for best virtualization support.
- Automatic updates are disabled because it may cause usability problems. If
  you want to enable back the automatic updates, please delete the file
  `/etc/apt/apt.conf.d/99no-periodic-updates` in the VM.

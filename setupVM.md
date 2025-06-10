# 1. Download ISO:
- Go to this link: https://alpinelinux.org/downloads/
- Select Virtual version (x86_64)

# 2. Create VM:
- Open Virtualbox, create new VM:
	- setup name: inception
	- location (in goinfre)
	- ISO image: not selected
	- Type: Linux
	- Version: Other Linux (64-bit)
	- Select Hardware, virtual hard disk
	- Finish
- Configure the VM: Select VM -> Settings
	- Storage -> controller: IDE -> optical drive -> Disk icon -> ISO image.
	- Network -> Adapter 1 -> Advanced -> Port Forwarding -> Adds new port: Host and Guest port: 2242
- Start the VM

# 3. Setup the VM

## Install OS:
- After starting-up, VM will ask to login -> root
- setup-alpine -> setup keyboard layout, hostname, timezone...
- Create root's password, create new user:
	- Root's password: changeMe123
	- New user: hitran, changeMe123
- Setup hard disk -> sda -> sys. In case that syslinux does not work, need to install syslinux
```ash
apk update
apk add syslinux
```
- Before reboot the VM, open Virtualbox, select the VM -> Settings -> remove ISO image. Then reboot the VM.
- View Os version: cat /etc/os-release

## Install services VM
```ash
su
apt install sudo
sudo apt-get upgrade
sudo apt install openssh-server
```
## Setup Docker
```ash
sudo apk add xorg-server xfce4 xfce4-terminal lightdm lightdm-gtk-greeter xf86-input-libinput elogind
sudo setup-devd udev
sudo rc-update add elogind
sudo rc-update add lightdm
sudo reboot
```

If after rebooting, the VM does not display a GUI:
- Open virtualbox -> setting -> display:
- Enable 3D Acceleration: ✅

## Setup other services:
```ashsudo apk update
sudo apk add git
sudo apk add firefox
```

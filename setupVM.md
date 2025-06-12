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
	- Network -> Adapter 1 -> Advanced -> Port Forwarding -> Adds new port: Host and Guest port: 2442 (or your choice)
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

## Install services VM:
### apk minors
```ash
su
vi /etc/apk/repositories
```

- Edit repositories: uncomment community links

### sudo
```ash
su
apk update
apk upgrade
apk add sudo
sudo visudo
```
- Edit visido: find and uncomment this line: %sudo	ALL=(ALL:ALL) ALL
```ash
su
getent group sudo
addgroup sudo
adduser hitran sudo
```

### ssh
```ash
su
apk add openssh-server
vi /etc/ssh/sshd_config
```
- Edit sshd_config file: find, uncomment and change:
	+ #Port 22 -> Port 2442
	+ #PermitRootLogin -> PermitRootLogin no

```ash
sudo rc-service sshd restart
```

- From host, check if can ssh:
```bash
ssh hitran@localhost -p 2442
```
If it is the first time, need to add [localhost]:2442 into hosts

## Setup GUI
```ash
su
apk add xorg-server
setup-xorg-base
setup-desktop
rc-update add dbus
reboot
```

## Setup Docker
```ash
su
apk add docker docker-compose
addgroup docker
adduser hitran group docker
apk add --update docker openrc
rc-update add docker boot
rc-service docker status
apk add docker-cli-compose
```



## Setup other services: git, make, build-base (for make), firefox
```ash
su
apk add git
apk add make
apk add build-base
apk add firefox
```
## Check services:
```ash
su
docker --version
docker-compose --version
make --version
```

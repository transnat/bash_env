# Packages
This role makes minor changes to userspace, implementing my preferred user environment, including my scripts, rc
files and configs, and CA certificates.

## Tasks
### [Install Packages](./tasks/install_packages.yml)
Installs Apt, DNF, Pacman, and Pip packages.

### [Remove Snap](./tasks/remove_snap.yml)
* Stops `snapd`.
* Uninstalls Snap.
* Masks `snapd.service`.
* Holds `snapd` in dpkg selections.

### [System Services](./tasks/system_services.yml)
Starts `systemd` sockets, services, and timers for installed packages.

### [usermod](./tasks/usermod.yml)
Creates requisite user groups and adds the system user.

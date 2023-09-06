# Packages
This role makes additive changes to userspace, installing some necessary packages and starting system services
like Docker.

## Tasks
### [Install Packages](./tasks/install_packages.yml)
Installs Apt, DNF, Pacman, and Pip packages.

### [System Services](./tasks/system_services.yml)
Starts `systemd` sockets, services, and timers for installed packages.

### [Usermod](./tasks/usermod.yml)
Creates requisite user groups and adds the system user.

# Performance Tweaks
This role makes minor changes to userspace, implementing my preferred user environment, including my scripts,
run-commands, configs, and CA certificates.

## Tasks
### [Install Dependencies](./tasks/install_dependencies.yml)
Installs requisite Apt/DNF/Pacman packages.

### [Filesystem](./tasks/filesystem.yml)
* Updates fstab to use `tmpfs` for `/tmp`.
* Starts `fstrim.timer`.

### [IO Schedulers](./tasks/io_sched.yml)
* Loads IO schedulers. (Requires reboot to take effect.)

### [Reflector](./tasks/reflector.yml)
**Arch-based systems only.**
* Starts `reflector.service` to update pacman mirror lists.

### [Timeshift](./tasks/timeshift.yml)
* Starts `timeshift` timers to perform regular system backups.

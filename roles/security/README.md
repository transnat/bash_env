# Security
This role makes **significant** changes to kernel, grub, sysctl, filesystem modes, system services.

Read and understand the tasks before running. Similarly: don't hold a lit firework in your hand, wait an hour
after eating to go swimming, and wear your sunscreen.

## Tasks
### [auditd](./tasks/auditd.yml)
Configures auditd per [/etc/audit/rules.d/audit.rules](./files/audit.rules)

### [filesystem](./tasks/filesystem.yml)
Hardens the filesystem by:
* Disabling coredump storage.
* Ensuring fstab uses: nodev, noexec, nosuid.
* Setting directory mode to 700 for import directories, including user home.
* Removing write permission for executables.
* Changing owner root:root, and mode for sensitive files in `/etc`.
* Setting umask 027 and ulimit in `/etc/profile`
* Setting umask 027 for shell rc-files.
* Removing rwx permissions for group/others on user home directory.

### [firewalld](./tasks/firewalld.yml)
Hardens layer three by:
* Blocking all incoming network connections via `firewalld`

### [kernel](./tasks/kernel.yml)
Hardens the kernol by:
* Securing sysctl variables.
* Securing GRUB flags.
* Loading the jitterentropy_rng kernel module.

### [priviledge_escalation](./tasks/priviledge_escalation.yml)
Secures common binaries used for priviledge escalation by:
* Disabling root access via console devices.
* Setting mode to 700 for su, sudo, pkexec.

### [ssh](./tasks/ssh.yml)
Hardens SSH by:
* Disabling host-based authentication.
* Disabling root login.

### [ulimit](./tasks/ulimit.yml)
Hardens user limits to:
* hard core 0
* soft core 0
* hard maxlogins 5

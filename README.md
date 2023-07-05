# Preferred Environment
**This README contains important information; please it in its entirety before running the playbook.**

This ansible playbook aims to:
* Harden Linux.
* Installing some useful packages.
* Optimize system performance.
* Set up an environment that I like.

Its scripts, functions, aliases and packages are ones that I find useful and enjoy having on any machine I
regularly use.

While the repository is *intended* to be portable, it should not be assumed to be in all cases. Distros I use with
regularity include Debian, Arch, and Ubuntu, and are - for the most part - supported by this repository.


## Requirements
* `ansible`
* `ansible-playbook`


## Role Overview
This playbook consists of four roles:
* [packages](#Packages)
* [security](#Security)
* `performance_tweaks` - Makes minor tweaks to the system fstab and IO schedulers to improve performance.
* `environment` - Installs a user environment that I like.

### Packages
Installs requisite system and pip packages (found [here](roles/packages/defaults/main.yml)).

### Security
This playbook makes **significant** changes to kernel, grub, sysctl, filesystem modes, system services.

Read and understand the tasks before running. Similarly: don't hold a lit firework in your hand, wait an hour
after eating to go swimming, and wear your sunscreen.

### Performance Tweaks
Presently the smallest role. Enables fstrim.timer, IO schedulers, some other stuff. RTFM.

### Environment


## Usage
Run:
```sh
ansible-playbook                                \
    -i localhost                                \
    -c local                                    \
    -K main.yml                                 \
    -u $(whoami)
```

You will be prompted for your local user password (Ansible calls this the "BECOME" password as it's needed to
'become' root), after which the playbook will run.

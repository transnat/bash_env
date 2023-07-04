# Preferred Environment
**This README contains important information; please it in its entirety before running the playbook.**

This ansible playbook aims to harden Linux while installing some useful packages (on Ubuntu) and optimizing
performance.
Its scripts, functions, aliases and packages are ones that I find useful and enjoy having on any machine I
regularly use.

While the repository is *intended* to be portable, it should not be assumed to be in all cases. Distros I use with
regularity include Debian, Arch, and Ubuntu, and are - for the most part - supported by this repository.


## Requirements
* `ansible`
* `ansible-playbook`


## Role Overview
This playbook consists of four roles:
* `packages` - Installs requisite packages (found in `roles/packages/defaults/main.yml`).
* `security` - Makes **significant** changes to kernel, grub, sysctl; ensures system configuration is sane; etc.
* `performance_tweaks` - Makes minor tweaks to the system fstab and IO schedulers to improve performance.
* `environment` - Installs a user environment that I like.


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

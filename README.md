# Preferred Environment
**This README contains important information; please it in its entirety before running the playbook.**

This ansible playbook aims to:
* Harden Linux.
* Optimize system performance.
* Installing some useful packages.
* Set up an environment that I like.

Its scripts, functions, aliases and packages are ones that I find useful and enjoy having on any machine I
regularly use.

While the repository is *intended* to be portable across Linux distributions, this should not be assumed. Distros
I use with regularity include Debian/Ubuntu, Fedora, and Arch and are supported by this repository.


## Requirements
* `ansible`
* `ansible-playbook`


## Role Overview
This playbook consists of four roles:
* [packages](./roles/packages/README.md)
* [security](./roles/security/README.md)
* [performance_tweaks](./roles/performance_tweaks/README.md)
* [environment](./roles/environment/README.md)

Further information on each roles' tasks can be found in the corresponding directory's README.md.

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
ansible-playbook                                    \
    -K "$(git rev-parse --show-toplevel)/main.yml"  \
    -i localhost                                    \
    -c local                                        \
    -u ${USER}
```

You will be prompted for your local user password (Ansible calls this the "BECOME" password as it's needed to
'become' root), after which the playbook will run.

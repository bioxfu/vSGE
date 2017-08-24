# vSGE

Virtual HPC with Sun Grid Engine

## Requirements

- Vagrant[https://www.vagrantup.com/downloads.html]
- Virtualbox[https://www.virtualbox.org/wiki/Downloads]

## Setup

```
vagrant up
```

## Test

```
for i in `seq 1 30`; do qsub -b y -o /vagrant/out.txt -e /vagrant/err.txt "bash /vagrant/test.sh"; done
```

## Reference

- https://peteris.rocks/blog/sun-grid-engine-installation-on-ubuntu-server/


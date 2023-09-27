# slab

## overview

This project is a collection of configuration files and scripts for setting up my personal homelab / development environment.

TLDR: 

my machine: macbook pro
other machines:
- srv-1: lenovo mini pc running proxmox
- coderbox: lenovo mini pc running ubuntu
- vault: synology nas1
- knossus: synology nas2

coderbox is running Coder, used to provision workspaces based on the templates in this repo.

srv-1 is running a private docker registry, a Nomad cluster, and a reverse proxy.

vault is running a local DNS server


## ansible

### playbooks

playbook.yml
- Main playbook, sets up private docker registry and cluster nodes.

populate-reg.yml
- Populates private docker registry with images.

uptime.yml
- Configures uptime-kuma monitors.

### galaxy roles

[ecshreve.docker](https://galaxy.ansible.com/ecshreve/docker)
- Installs and configures docker.


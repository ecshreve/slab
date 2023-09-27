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

## terraform

Deploy VMs to Proxmox. Most common arguments are abstracted out into
the child module `ubuvm` where default values are set. In the past I've maintained
this module in a private Terraform registry, but that was cumbersome to maintain
and harder to document and reason about.

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

## coder

Base images maintained in public docker repo, based on Dockerfiles found throughout
the Coder documentation and related projects.

At this time the `coderall-tmpl` is the Coder template I use for new workspaces. It's
based on the `ecshreve/coderall:eric` image. Which yieds a Ubuntu 22.04 based workspace
with varioud development tools and settings pre-configured.

### screenshots

![coder](/static/coder.png)
![consul](/static/consul.png)
![nomad](/static/nomad.png)
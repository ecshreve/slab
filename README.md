# slab

## Overview

Slab is a project encompassing a suite of configuration files and scripts designed to streamline the setup of my personal homelab and development environment. 

The environment consists of:

- **My Machine**: MacBook Pro
- **srv-1**: A Lenovo mini PC running Proxmox, a private Docker registry, a Nomad cluster, and a reverse proxy.
- **Coderbox**: A Lenovo mini PC running Ubuntu and Coder for workspace provisioning based on this repo's templates.
- **Vault**: A Synology NAS1 running a local DNS server.
- **Knossus**: A Synology NAS2.

## Terraform

Terraform is used to manage the infrastructure of the project. The main components include:

- **Main.tf**: This file contains the primary configuration for the infrastructure.
- **Variables.tf**: This file defines the variables used in the main configuration.
- **Outputs.tf**: This file defines the outputs of the Terraform configuration.

## Ansible

Ansible is used for configuration management. The main components include:

## Playbooks

- **playbook.yml**: Sets up private Docker registry and cluster nodes.
- **populate-reg.yml**: Populates private Docker registry with images.
- **uptime.yml**: Configures Uptime-Kuma monitors.

## Galaxy Roles

- **[ecshreve.docker](https://galaxy.ansible.com/ecshreve/docker)**: Installs and configures Docker.

## Coder

Coder uses base images maintained in a public Docker repository. These images are based on Dockerfiles found in the Coder documentation and related projects.

### Base Image

- **coderall-tmpl**: This is the Coder template used for new workspaces. It's based on the `ecshreve/coderall:eric` image, which provides an Ubuntu 22.04 based workspace with various development tools and settings pre-configured.

![coder](/static/coder.png)

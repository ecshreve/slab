terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.14"
    }
  }
}

provider "proxmox" {
  pm_tls_insecure     = true
}

variable "sshkey" {
  type = string
}

module "cluster" {
  count  = 1
  source = "./modules/ubuvm"
  pubkey = var.sshkey

  name = "node-${count.index}"
  vmid = 140 + count.index

  ip_address = "10.14.40.14${count.index}/24"
  mem = 8192
}

module "workers" {
  count  = 2
  source = "./modules/ubuvm"
  pubkey = var.sshkey

  name = "worker-${count.index}"
  vmid = 160 + count.index

  ip_address = "10.14.40.16${count.index}/24"
}

module "registry" {
  count  = 1
  source = "./modules/ubuvm"
  pubkey = var.sshkey

  name = "docker-registry"
  vmid = 5000

  ip_address = "10.14.40.185/24"
  disk  = "50G"
}
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

module "cluster" {
  count  = 1
  source = "app.terraform.io/slablan/ubuntu-vm/proxmox"
  version = "1.1.5"

  name = "node-${count.index}"
  vmid = 140 + count.index
  ip_address = "10.14.40.14${count.index}/24"
  cores = 2
  mem = 8192
}

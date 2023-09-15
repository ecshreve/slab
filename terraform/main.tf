terraform {
  cloud {
    organization = "slablan"

    workspaces {
      name = "slab"
    }
  }
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

module "devbox" {
  count  = 0
  source = "app.terraform.io/slablan/ubuntu-vm/proxmox"
  version = "1.1.4"

  name = "devbox"
  vmid = 501

  ip_address = "10.14.40.100"
  mem   = 8196
  disk  = "20G"
}

module "dbox" {
  count  = 1
  source = "app.terraform.io/slablan/ubuntu-vm/proxmox"
  version = "1.1.5"

  name = "dbox"
  vmid = 601
  ip_address = "dhcp"
}
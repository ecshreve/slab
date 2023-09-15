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

module "devbox" {
  count  = 1
  source = "app.terraform.io/slablan/ubuntu-vm/proxmox"

  name       = "devbox"
  vmid       = 5000
  cores      = 2
  mem        = 4096
  disk       = "24G"
  ip_address = "10.40.40.200"
}
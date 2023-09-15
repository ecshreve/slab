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

module "ubuntu_vm" {
  count  = 1
  source = "app.terraform.io/slablan/ubuntu-vm/proxmox"
  version = "1.1.3"

  name       = "devbox"
  vmid       = 5000
  cores      = 2
  mem        = 4096
  disk       = "24G"
  ip_address = "10.40.40.200"
}
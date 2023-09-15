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

module "devbox" {
  count  = 1
  source = "app.terraform.io/slablan/ubuntu-vm/proxmox"
  version = "1.1.5"

  name = "devbox"
  vmid = 800
  ip_address = "10.14.40.80/24"
  mem = 8192
  disk = "24G"
}

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
  vmid = 190 + count.index
  ip_address = "10.14.40.19${count.index}/24"
  cores = 2
  mem = 4096
  # pubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMu95UhPrZHh/+0O0v6QCn46VodoT7RLZDRlGP6rTWW2"
}

module "cluster2" {
  count  = 1
  source = "app.terraform.io/slablan/ubuntu-vm/proxmox"
  version = "1.1.5"

  name = "node-1${count.index}"
  vmid = 160 + count.index
  ip_address = "10.14.40.16${count.index}/24"
  cores = 2
  mem = 4096
  pubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMu95UhPrZHh/+0O0v6QCn46VodoT7RLZDRlGP6rTWW2"
}
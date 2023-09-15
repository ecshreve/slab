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

# variable "ssh_key" {
#   type      = string
#   sensitive = true
# }

provider "proxmox" {
  pm_tls_insecure     = true
}

module "devbox" {
  count  = 1
  source = "app.terraform.io/slablan/ubuntu-vm/proxmox"
  version = "1.1.3"

  name = "devbox"
  vmid = 5101

  bridge          = "vmbr0"
  gateway_address = "10.14.40.1"
  ip_address      = "10.14.40.100"

  cores = 2
  mem   = 8196
  disk  = "20G"
}

# resource "proxmox_vm_qemu" "dbox" {
#   // Configure general VM parameters
#   count       = 0
#   target_node = "srv-1"
#   name        = "devbox1"
#   vmid        = 5100
#   clone       = "ubuntu-jammy-server-cloudimg-tmpl"
#   os_type     = "cloud-init"
#   agent       = 1

#   // Configure resources for the new VM
#   cpu      = "host"
#   sockets  = 1
#   cores    = 2
#   memory   = 4096
#   scsihw   = "virtio-scsi-pci"
#   bootdisk = "scsi0"

#   // Configure disk resource
#   disk {
#     size    = "12G"
#     type    = "scsi"
#     storage = "local-lvm"
#   }

#   network {
#     model  = "virtio"
#     bridge = "vmbr0"
#   }

#   lifecycle {
#     ignore_changes = [
#       network,
#     ]
#   }

#   // Configure cloud init params like IP address, DNS servers, user, etc
#   ipconfig0    = "ip=10.40.10.100/24,gw=10.40.10.1"
#   ciuser       = "root"
#   cipassword   = "password"
#   sshkeys      = var.ssh_key
# }
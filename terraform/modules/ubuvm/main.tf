terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.14"
    }
  }
}

resource "proxmox_vm_qemu" "virtualmachine" {
  target_node = var.node
  name        = var.name
  clone       = var.cloneimg
  os_type     = "cloud-init"
  qemu_os     = "other"
  agent       = 1
  vmid        = var.vmid

  cpu      = "host"
  sockets  = 1
  cores    = var.cores
  memory   = var.mem
  scsihw   = "virtio-scsi-pci"
  bootdisk = "scsi0"

  disk {
    size    = var.disk
    type    = "scsi"
    storage = "local-lvm"
  }

  network {
    model  = "virtio"
    bridge = var.bridge
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }

  ipconfig0    = "ip=${var.ip_address},gw=${var.gateway_address}"
  nameserver   = var.dns_server
  searchdomain = var.dns_search
  ciuser       = var.user
  cipassword   = var.password
  sshkeys      = var.pubkey
}

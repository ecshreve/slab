output "hostname" {
  value = proxmox_vm_qemu.virtualmachine.name
}

output "vmid" {
  value = proxmox_vm_qemu.virtualmachine.vmid
}
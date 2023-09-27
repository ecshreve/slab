variable "ip_address" {
  type        = string
  description = "ip address for the vm"
}

variable "name" {
  type        = string
  description = "name for the new vm"
}

variable "vmid" {
  type        = number
  description = "explicit vmid for the new vm"
}

variable "pubkey" {
  type        = string
  description = "public ssh key to add for user"
  sensitive   = true
}

variable "cloneimg" {
  type        = string
  description = "cloudinit image name to clone from"
  default     = "ubuntu-jammy-server-cloudimg-tmpl"
}

variable "cores" {
  type        = number
  description = "number of cpu cores"
  default     = 2
}

variable "disk" {
  type        = string
  description = "disk size"
  default     = "12G"
}

variable "dns_search" {
  type        = string
  description = "dns search domain"
  default     = "slab.lan"
}

variable "dns_server" {
  type        = string
  description = "address of dns server for the vm"
  default     = "10.14.40.107"
}

variable "gateway_address" {
  type        = string
  description = "gateway ip address"
  default     = "10.14.40.1"
}

variable "bridge" {
  type        = string
  description = "bridge to attach vm to"
  default     = "vmbr0"
}

variable "mem" {
  type        = number
  description = "amount of memory (MB)"
  default     = 2048
}

variable "node" {
  type        = string
  description = "proxmox cluster node to target"
  default     = "srv-1"
}

variable "password" {
  type        = string
  description = "password for new user"
  default     = "password"
  sensitive   = true
}



variable "user" {
  type        = string
  description = "user to create"
  default     = "eric"
}
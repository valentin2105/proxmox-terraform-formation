# --- Proxmox Connection ---

variable "proxmox_endpoint" {
  description = "URL of the Proxmox API (e.g. https://192.168.1.10:8006)"
  type        = string
}

variable "proxmox_username" {
  description = "Proxmox user (e.g. root@pam)"
  type        = string
  default     = "root@pam"
}

variable "proxmox_password" {
  description = "Proxmox user password"
  type        = string
  sensitive   = true
}

variable "proxmox_insecure" {
  description = "Skip TLS certificate verification"
  type        = bool
  default     = true
}

# --- Common VM defaults ---

variable "proxmox_node" {
  description = "Proxmox node name where VMs will be created"
  type        = string
  default     = "pve"
}

variable "template_id" {
  description = "VM ID of the Debian 13 cloud-init template to clone"
  type        = number
  default     = 102
}

variable "default_gateway" {
  description = "Default gateway for all VMs"
  type        = string
}

variable "dns_servers" {
  description = "DNS servers for all VMs"
  type        = list(string)
  default     = ["1.1.1.1", "8.8.8.8"]
}

variable "ssh_public_keys" {
  description = "SSH public keys injected via cloud-init"
  type        = string
}

variable "default_user" {
  description = "Default cloud-init user"
  type        = string
  default     = "debian"
}

# --- VM list ---

variable "vms" {
  description = "List of VMs to create"
  type = list(object({
    name      = string
    disk_size = number # in GB
    ip        = string # CIDR notation, e.g. 192.168.1.50/24
    ram       = number # in MB
    cpu       = number # number of vCPUs
  }))
  default = []
}

output "vm_ids" {
  description = "VM IDs created by Proxmox"
  value       = { for name, vm in proxmox_virtual_environment_vm.vms : name => vm.vm_id }
}

output "vm_ips" {
  description = "IP addresses configured via cloud-init"
  value       = { for name, vm in var.vms : vm.name => vm.ip }
}

output "vm_names" {
  description = "Names of all created VMs"
  value       = [for vm in proxmox_virtual_environment_vm.vms : vm.name]
}

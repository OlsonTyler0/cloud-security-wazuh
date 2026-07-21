output "wazuh_server_name" {
  description = "Name of the Wazuh server VM that Terraform manages."
  value       = proxmox_vm_qemu.wazuh_server.name
}

output "endpoint_vm_name" {
  description = "Name of the endpoint VM that Terraform manages."
  value       = proxmox_vm_qemu.endpoint_vm.name
}

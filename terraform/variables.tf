variable "proxmox_user" {
  description = "Proxmox authentication user for Terraform."
  type        = string
  default     = "terraform@pam"
}

variable "proxmox_api_url" {
  description = "Proxmox API URL for the private cloud environment."
  type        = string
  default     = ""
}

variable "proxmox_api_token_id" {
  description = "API token ID used by Terraform to authenticate to Proxmox."
  type        = string
  default     = ""
}

variable "proxmox_api_token_secret" {
  description = "API token secret used by Terraform to authenticate to Proxmox."
  type        = string
  default     = ""
  sensitive   = true
}

variable "proxmox_node" {
  description = "Target Proxmox node name."
  type        = string
  default     = "pve"
}

variable "template_name" {
  description = "Template VM to clone for the Wazuh server and endpoint VM."
  type        = string
  default     = "ubuntu-cloud-template"
}

variable "storage_pool" {
  description = "Storage pool where the VM disks should be created."
  type        = string
  default     = "local-lvm"
}

variable "wazuh_server_id" {
  description = "VM ID assigned to the Wazuh server VM."
  type        = number
  default     = 201
}

variable "wazuh_server_name" {
  description = "Name of the Wazuh server VM."
  type        = string
  default     = "wazuh-server"
}

variable "wazuh_server_user_password" {
  description = "Password for the Wazuh server cloud-init user."
  type        = string
  default     = "changeme"
  sensitive   = true
}

variable "endpoint_vm_name" {
  description = "Name of the protected endpoint VM."
  type        = string
  default     = "web-endpoint"
}

variable "endpoint_vm_user_password" {
  description = "Password for the endpoint VM cloud-init user."
  type        = string
  default     = "changeme"
  sensitive   = true
}

variable "ssh_key" {
  description = "Optional SSH public key to inject into the VMs during cloud-init."
  type        = string
  default     = ""
}

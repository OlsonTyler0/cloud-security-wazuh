terraform {
  required_version = ">= 1.5.0"

  // Set up the required provider.
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox" // Documentation: https://registry.terraform.io/providers/Telmate/proxmox/latest/docs
      version = "~> 2.9"
    }
  }
}

// Settings for the provider, see the terraform.tfvars.example for an example variables file.
provider "proxmox" {
  pm_user             = var.proxmox_user
  pm_api_url          = var.proxmox_api_url != "" ? var.proxmox_api_url : var.proxmox_endpoint
  pm_api_token_id     = var.proxmox_api_token_id
  pm_api_token_secret = var.proxmox_api_token_secret
  pm_tls_insecure     = true
}

// The actual Wazuh server.
resource "proxmox_vm_qemu" "wazuh_server" {
  vmid        = var.wazuh_server_id
  name        = var.wazuh_server_name
  description = "Tyler's Wazuh Project"
  target_node = var.proxmox_node
  clone       = var.template_name
  agent       = 1
  vm_state    = "running"
  automatic_reboot = true

  // Resource allocation
  cores   = 4
  memory  = 8192

  // Cloud-init configuration
  cicustom   = "vendor=local:snippets/qemu-guest-agent.yml" # /var/lib/vz/snippets/qemu-guest-agent.yml
  ciupgrade  = true
  nameserver = "1.1.1.1 8.8.8.8"
  ipconfig0  = "ip=dhcp,ip6=dhcp"
  skip_ipv6  = true
  ciuser     = "root"
  cipassword = var.wazuh_server_user_password
  sshkeys    = var.ssh_key

  disks {
    scsi {
      scsi0 {
        # We have to specify the disk from our template, else Terraform will think it's not supposed to be there
        disk {
          storage = var.storage_pool
          # The size of the disk should be at least as big as the disk in the template. If it's smaller, the disk will be recreated
          size    = "50G"
        }
      }
    }
    ide {
      # Some images require a cloud-init disk on the IDE controller, others on the SCSI or SATA controller
      ide1 {
        cloudinit {
          storage = var.storage_pool
        }
      }
    }
  }


  network {
    id = 0
    model  = "virtio"
    bridge = "vmbr0"
  }
}

resource "proxmox_vm_qemu" "endpoint_vm" {
  name        = var.endpoint_vm_name
  description = "Protected endpoint VM"
  target_node = var.proxmox_node
  clone       = var.template_name
  agent       = 1
  vm_state    = "running"
  automatic_reboot = true

  cores  = 2
  memory = 2048

  // Cloud-init configuration
  cicustom   = "vendor=local:snippets/qemu-guest-agent.yml" # /var/lib/vz/snippets/qemu-guest-agent.yml
  ciupgrade  = true
  nameserver = "1.1.1.1 8.8.8.8"
  ipconfig0  = "ip=dhcp,ip6=dhcp"
  skip_ipv6  = true
  ciuser     = "root"
  cipassword = var.endpoint_vm_user_password
  sshkeys    = var.ssh_key

  disks {
    scsi {
      scsi0 {
        disk {
          storage = var.storage_pool
          size    = "20G"
        }
      }
    }
    ide {
      ide1 {
        cloudinit {
          storage = var.storage_pool
        }
      }
    }
  }

  network {
    id = 0
    model  = "virtio"
    bridge = "vmbr0"
  }
}

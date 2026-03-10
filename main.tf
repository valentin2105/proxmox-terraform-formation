locals {
  # Index VMs by name for easy reference
  vms_map = { for vm in var.vms : vm.name => vm }
}

resource "proxmox_virtual_environment_vm" "vms" {
  for_each = local.vms_map

  name      = each.value.name
  node_name = var.proxmox_node
  vm_id     = null # auto-assigned

  description = "Managed by Terraform — cloned from template ${var.template_id}"
  tags        = ["terraform", "debian"]

  # --- Clone from template ---
  clone {
    vm_id   = var.template_id
    full    = true
    retries = 3
  }

  # --- CPU ---
  cpu {
    cores   = each.value.cpu
    sockets = 1
    type    = "x86-64-v2-AES"
  }

  # --- Memory ---
  memory {
    dedicated = each.value.ram
  }

  # --- Boot disk (resized to desired size) ---
  disk {
    interface    = "scsi0"
    size         = each.value.disk_size
    datastore_id = "local-lvm"
    discard      = "on"
    iothread     = true
  }

  # --- Network ---
  network_device {
    bridge = "vmbr1"
    model  = "virtio"
  }

  # --- Cloud-init drive ---
  initialization {
    datastore_id = "local-lvm"

    ip_config {
      ipv4 {
        address = each.value.ip
        gateway = var.default_gateway
      }
    }

    dns {
      servers = var.dns_servers
    }

    user_account {
      username = var.default_user
      keys     = [var.ssh_public_keys]
    }
  }

  # --- Agent ---
  agent {
    enabled = true
    trim    = true
  }

  # --- Boot order ---
  boot_order = ["scsi0", "net0"]

  operating_system {
    type = "l26"
  }

  lifecycle {
    ignore_changes = [
      # Avoid drift from manual snapshot/notes changes
      description,
      initialization,
    ]
  }
}

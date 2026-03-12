proxmox_endpoint = "https://172.30.30.109:8006"
proxmox_username = "admin@pve"
proxmox_password = "123soleil"
proxmox_insecure = true

proxmox_node    = "pve09"
template_id     = 9000
default_gateway = "10.1.0.1"
dns_servers     = ["1.1.1.1", "8.8.8.8"]
default_user    = "debian"

ssh_public_keys = <<-EOT
  ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEdgr0Gdhl5HYjK6LP1LX8RSML5BrGQZhDkflgIxCgIj valentin@MBPOps(23/08/2024)
EOT

vms = [
  {
    name      = "srv-01"
    disk_size = 10
    ip        = "10.1.100.10/16"
    ram       = 1024
    cpu       = 1
  },
  {
    name      = "srv-02"
    disk_size = 10
    ip        = "10.1.100.11/16"
    ram       = 1024
    cpu       = 1
  },
  {
    name      = "srv-03"
    disk_size = 10
    ip        = "10.1.100.12/16"
    ram       = 1024
    cpu       = 1
  },
  {
    name      = "srv-04"
    disk_size = 10
    ip        = "10.1.100.13/16"
    ram       = 1024
    cpu       = 1
  },
  {
    name      = "srv-05"
    disk_size = 10
    ip        = "10.1.100.14/16"
    ram       = 1024
    cpu       = 1
  },
  {
    name      = "srv-06"
    disk_size = 10
    ip        = "10.1.100.15/16"
    ram       = 1024
    cpu       = 1
  },
  {
    name      = "srv-07"
    disk_size = 10
    ip        = "10.1.100.16/16"
    ram       = 1024
    cpu       = 1
  },
  {
    name      = "srv-08"
    disk_size = 10
    ip        = "10.1.100.17/16"
    ram       = 1024
    cpu       = 1
  },
  {
    name      = "srv-09"
    disk_size = 10
    ip        = "10.1.100.18/16"
    ram       = 1024
    cpu       = 1
  },
  {
    name      = "srv-10"
    disk_size = 10
    ip        = "10.1.100.19/16"
    ram       = 1024
    cpu       = 1
  },
]

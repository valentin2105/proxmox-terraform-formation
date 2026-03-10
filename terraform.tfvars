proxmox_endpoint = "https://172.30.30.109:8006"
proxmox_username = "admin@pve"
proxmox_password = "123soleil"
proxmox_insecure = true

proxmox_node    = "pve09"
template_id     = 102
default_gateway = "10.1.0.1"
dns_servers     = ["1.1.1.1", "8.8.8.8"]
default_user    = "debian"

ssh_public_keys = <<-EOT
  ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEdgr0Gdhl5HYjK6LP1LX8RSML5BrGQZhDkflgIxCgIj valentin@MBPOps(23/08/2024)
EOT

vms = [
  {
    name      = "web-01"
    disk_size = 20
    ip        = "10.1.100.10/16"
    ram       = 2048
    cpu       = 2
  },
  {
    name      = "db-01"
    disk_size = 22
    ip        = "10.1.100.11/16"
    ram       = 2048
    cpu       = 4
  }
]

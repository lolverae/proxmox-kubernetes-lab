resource "proxmox_lxc" "server" {
  count         = var.server_count
  hostname      = "${var.server_name}-${count.index + 1}"
  vmid          = count.index + 200
  target_node   = var.proxmox_node
  ostemplate    = var.os_template
  password      = var.ct_password
  unprivileged  = true
  cores          = 1
  memory        = 1024

  rootfs {
    storage = "local-lvm"
    size    = "5G"
  }

  network {
    name  = "eth0"
    bridge = "vmbr0"
    ip    = "dhcp"
  }

  start = true
}


resource "proxmox_lxc" "debian_server" {
  count = 1
  hostname = "debian-${count.index + 1}"
  vmid = count.index + 3001

  target_node = var.proxmox_node
  ostemplate = "local:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst"
  password = var.ct_password
  unprivileged = true

  cores = 1
  memory = 1024

  rootfs {
    storage = "local-lvm"
    size    = "5G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"
  }

  start = true
}


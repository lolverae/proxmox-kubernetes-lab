resource "proxmox_lxc" "debian_server" {
  count    = 1
  hostname = "debian-${count.index + 1}"
  vmid     = count.index + 200

  target_node  = var.proxmox_node
  ostemplate   = "local:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst"
  password     = var.ct_password
  unprivileged = true

  cores  = 1
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

resource "ansible_host" "my_host" {
  count  = 1
  name   = proxmox_lxc.debian_server[count.index].vmid
  groups = ["containers"]
  variables = {
    lxc_host      = proxmox_lxc.debian_server[count.index].vmid
    physical_host = "pve1"
  }
}

resource "ansible_host" "my_host2" {
  name   = "pve1"
  groups = ["hosts"]
  variables = {
    ansible_host = "http://20.0.0.38/"
    ansible_user = "root"
  }
}


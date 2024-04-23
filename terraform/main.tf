resource "proxmox_lxc" "debian_server" {
  count        = 1
  hostname     = "debian-${count.index + 1}"
  vmid         = count.index + 200
  target_node  = var.proxmox_node
  ostemplate   = "local:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst"
  password     = var.ct_password
  unprivileged = true
  cores        = 1
  memory       = 1024

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

resource "ansible_host" "debian_host" {
  count  = 1
  name   = proxmox_lxc.debian_server[count.index].vmid
  groups = ["containers"]
  variables = {
    lxc_host      = proxmox_lxc.debian_server[count.index].vmid
    physical_host = "pve1"
  }
}

resource "ansible_playbook" "myplaybook" {
  playbook   = "../ansible/update_all.yaml"
  name       = proxmox_lxc.debian_server[0].hostname
  replayable = true
  extra_vars = {
    ansible_user      = var.ansible_user
    ansible_password  = var.ansible_password
    ansible_sudo_pass = var.ansible_become_password
  }

}


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


resource "ansible_host" "debian_host" {
  count  = var.server_count
  name   = var.server_id[count.index]
  groups = ["containers"]
  variables = {
    lxc_host      = var.server_id[count.index]
    physical_host = "pve1"
  }
}

resource "ansible_playbook" "myplaybook" {
  playbook   = "../../../ansible/update_all.yaml"
  name       = "Update playbook"
  replayable = true
  extra_vars = {
    ansible_user      = var.ansible_user
    ansible_password  = var.ansible_password
    ansible_sudo_pass = var.ansible_become_password
  }

}


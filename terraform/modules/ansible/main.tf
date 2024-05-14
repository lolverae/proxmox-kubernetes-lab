resource "ansible_host" "debian_host" {
  count  = var.server_count
  name   = var.server_id[count.index]
  groups = ["debian_servers"]
  variables = {
    lxc_host      = var.server_id[count.index]
    physical_host = "pve1"
  }
}

resource "ansible_host" "alma_host" {
  count  = var.server_count
  name   = var.server_id[count.index]
  groups = ["almalinux_servers"]
  variables = {
    lxc_host      = var.server_id[count.index]
    physical_host = "pve1"
  }
}

resource "ansible_playbook" "testplaybook" {
  playbook   = "../../../ansible/update_all.yaml"
  name       = "Update playbook"
  replayable = true
  extra_vars = {
    ansible_user      = var.ansible_user
    ansible_password  = var.ansible_password
    ansible_sudo_pass = var.ansible_become_password
  }
}

resource "ansible_playbook" "setupdebian" {
  playbook   = "../../../ansible/setup_debian.yaml"
  name       = "Setup Debian playbook"
  replayable = true
  extra_vars = {
    ansible_user      = var.ansible_user
    ansible_password  = var.ansible_password
    ansible_sudo_pass = var.ansible_become_password
  }
}

resource "ansible_playbook" "setupalma" {
  playbook   = "../../../ansible/setup_alma.yaml"
  name       = "Setup Alma playbook"
  replayable = true
  extra_vars = {
    ansible_user      = var.ansible_user
    ansible_password  = var.ansible_password
    ansible_sudo_pass = var.ansible_become_password
  }
}


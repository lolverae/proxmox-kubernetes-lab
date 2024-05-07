module "debian_server" {
  source                   = "./modules/proxmox"
  server_name              = "debian"
  os_template              = "local:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst"
  server_count             = 1
  ct_password              = var.ct_password
  proxmox_api_token_secret = var.proxmox_api_token_secret
  proxmox_api_token_id     = var.proxmox_api_token_id
  proxmox_api_url          = var.proxmox_api_url
}

module "alma_server" {
  source                   = "./modules/proxmox"
  server_name              = "alma"
  os_template              = "local:vztmpl/almalinux-9-default_20221108_amd64.tar.zst"
  server_count             = 1
  ct_password              = var.ct_password
  proxmox_api_token_secret = var.proxmox_api_token_secret
  proxmox_api_token_id     = var.proxmox_api_token_id
  proxmox_api_url          = var.proxmox_api_url
}

module "ansible_debian" {
  source                  = "./modules/ansible/"
  ansible_password        = var.ansible_password
  ansible_become_password = var.ansible_become_password
  server_id               = module.debian_server.server_id
  server_count            = var.server_count
}

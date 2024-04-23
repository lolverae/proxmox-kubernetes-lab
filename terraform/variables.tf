variable "proxmox_api_url" {
  type = string
}

variable "proxmox_api_token_id" {
  type      = string
  sensitive = true
}

variable "proxmox_api_token_secret" {
  type      = string
  sensitive = true
}

variable "proxmox_node" {
  type = string
}

variable "ct_password" {
  type      = string
  sensitive = true
}

variable "ansible_user" {
  type    = string
  default = "alberto"
}

variable "ansible_password" {
  type      = string
  sensitive = true
}

variable "ansible_become_password" {
  type      = string
  sensitive = true
}


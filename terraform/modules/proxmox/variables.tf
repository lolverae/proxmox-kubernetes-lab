variable "server_name" {
  type = string
}

variable "server_count" {
  type = number
}

variable "os_template" {
  type = string
}

variable "proxmox_node" {
  default = "value"
  type = string
}

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

variable "ct_password" {
  type      = string
  sensitive = true
}


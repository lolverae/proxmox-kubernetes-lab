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

variable "server_count" {
  type = number
}

variable "server_id" {
  type = any 
}


module "main_node" {
  source              = "./modules/talos_vm"
  node_count          = 1
  pm_host             = var.pm_host1
  pm_api_url          = var.pm_api_url
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  pm_tls_insecure     = var.pm_tls_insecure
  vm_talos_tmpl_name  = var.vm_talos_tmpl_name
  vm_name_prefix      = "${var.env_name}-${var.pm_host1}-vm"
  vm_max_vcpus        = var.vm_max_vcpus
  vm_vcpus            = 1
  vm_sockets          = var.vm_sockets
  vm_cpu_type         = var.vm_cpu_type
  vm_os_disk_storage  = var.vm_os_disk_storage
  vm_net_name         = var.internal_net_name
  vm_net_subnet_cidr  = var.internal_net_subnet_cidr
  vm_host_number      = 10
  vm_user             = var.vm_user
  vm_tags             = var.env_name
}

module "secondary_node" {
  source              = "./modules/talos_vm"
  node_count          = 1
  pm_host             = var.pm_host2
  pm_api_url          = var.pm_api_url
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  pm_tls_insecure     = var.pm_tls_insecure
  vm_talos_tmpl_name  = var.vm_talos_tmpl_name
  vm_name_prefix      = "${var.env_name}-${var.pm_host2}-vm"
  vm_max_vcpus        = var.vm_max_vcpus
  vm_vcpus            = 1
  vm_sockets          = var.vm_sockets
  vm_cpu_type         = var.vm_cpu_type
  vm_os_disk_storage  = var.vm_os_disk_storage
  vm_net_name         = var.internal_net_name
  vm_net_subnet_cidr  = var.internal_net_subnet_cidr
  vm_host_number      = 10
  vm_user             = var.vm_user
  vm_tags             = var.env_name
}

module "third_node" {
  source              = "./modules/talos_vm"
  node_count          = 1
  pm_host             = var.pm_host3
  pm_api_url          = var.pm_api_url
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  pm_tls_insecure     = var.pm_tls_insecure
  vm_talos_tmpl_name  = var.vm_talos_tmpl_name
  vm_name_prefix      = "${var.env_name}-${var.pm_host3}-vm"
  vm_max_vcpus        = var.vm_max_vcpus
  vm_vcpus            = 1
  vm_sockets          = var.vm_sockets
  vm_cpu_type         = var.vm_cpu_type
  vm_os_disk_storage  = var.vm_os_disk_storage
  vm_net_name         = var.internal_net_name
  vm_net_subnet_cidr  = var.internal_net_subnet_cidr
  vm_host_number      = 10
  vm_user             = var.vm_user
  vm_tags             = var.env_name
}


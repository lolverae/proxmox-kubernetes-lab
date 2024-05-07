output "server_id" {
  value = tomap({
    for id, server in proxmox_lxc.server : id => server.id
  })
}

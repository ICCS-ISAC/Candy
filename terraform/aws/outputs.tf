output "ansible_inventory" {
  value = templatefile("${path.module}/templates/inventory.tpl",
    {
      node_addresses = module.indy-node.*.node_address
    }
  )
}
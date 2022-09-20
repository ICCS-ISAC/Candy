output "ansible_inventory" {
  value = templatefile("${path.module}/templates/inventory.tpl",
    {
      node_info = module.indy-node.*.node_info
    }
  )
}

output "resource_group_info" {
  value = <<INFO
    # ===================================================================
    # RESOURCE GROUP INFO
    # -------------------------------------------------------------------
        NAME: ${azurerm_resource_group.resource_group.name}
          ID: ${azurerm_resource_group.resource_group.id}
    LOCATION: ${azurerm_resource_group.resource_group.location}
    # ===================================================================
  INFO
}

output "ansible_inventory" {
  value = templatefile("${path.module}/templates/inventory.tpl",
    {
      node_addresses = module.indy-node.*.node_address
    }
  )
}
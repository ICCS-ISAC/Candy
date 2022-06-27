output "node_address" {
  # The Primary Public IP Address assigned to this Virtual Machine.
  value = azurerm_linux_virtual_machine.indy_node.public_ip_address
  # A list of the Public IP Addresses assigned to this Virtual Machine.
  # value = azurerm_linux_virtual_machine.indy_node.private_ip_address
}
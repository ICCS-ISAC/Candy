output "node_address" {
  # The Primary Public IP Address assigned to this Virtual Machine.
  value = azurerm_linux_virtual_machine.indy_node.public_ip_address
}
# Create virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.instance_name}_vnet"
  address_space       = var.vnet_address_range
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name

  tags = merge({
    Name     = "${var.instance_name}_vnet"
    Instance = var.instance_name
  }, var.default_tags)
}

# Create the Client Subnet
resource "azurerm_subnet" "client_subnet" {
  name                 = "${var.instance_name}_client_subnet"
  resource_group_name  = var.resource_group.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.client_subnet_range
}

# Create the Node Subnet
resource "azurerm_subnet" "node_subnet" {
  name                 = "${var.instance_name}_node_subnet"
  resource_group_name  = var.resource_group.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.node_subnet_range
}

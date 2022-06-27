# Create virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.instance_name}_vnet"
  address_space       = ["10.0.0.0/16"]
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
  address_prefixes     = ["10.0.1.0/24"]
}

# Create the Node Subnet
resource "azurerm_subnet" "node_subnet" {
  name                 = "${var.instance_name}_node_subnet"
  resource_group_name  = var.resource_group.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

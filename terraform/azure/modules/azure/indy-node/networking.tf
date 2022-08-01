# Create the Client Public IP
resource "azurerm_public_ip" "client_public_ip" {
  name                = "${var.instance_name}_client_public_ip"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  allocation_method   = "Static"

  tags = merge({
    Name     = "${var.instance_name}_client_public_ip"
    Instance = var.instance_name
  }, var.default_tags)
}

# Create the Node Public IP
resource "azurerm_public_ip" "node_public_ip" {
  name                = "${var.instance_name}_node_public_ip"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  allocation_method   = "Static"

  tags = merge({
    Name     = "${var.instance_name}_node_public_ip"
    Instance = var.instance_name
  }, var.default_tags)
}

# Create network security groups and rules
resource "azurerm_network_security_group" "client_nsg" {
  name                = "${var.instance_name}_client_nsg"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name

  tags = merge({
    Name     = "${var.instance_name}_client_nsg"
    Instance = var.instance_name
  }, var.default_tags)
}

# ToDo:
#   - Configure this so it can be turned on and off.
#     - Since it's only needed to configure the node for the most part.
resource "azurerm_network_security_rule" "client_nsr_ssh" {
  name                        = "${var.instance_name}_SSH"
  priority                    = 1001
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = var.ssh_source_address
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group.name
  network_security_group_name = azurerm_network_security_group.client_nsg.name
}

resource "azurerm_network_security_rule" "client_nsr_indy" {
  name                        = "${var.instance_name}_indy"
  priority                    = 1003
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = var.client_port
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group.name
  network_security_group_name = azurerm_network_security_group.client_nsg.name
}

resource "azurerm_network_security_group" "node_nsg" {
  name                = "${var.instance_name}_node_nsg"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name

  tags = merge({
    Name     = "${var.instance_name}_node_nsg"
    Instance = var.instance_name
  }, var.default_tags)
}

resource "azurerm_network_security_rule" "node_nsr_indy" {
  name                        = "${var.instance_name}_indy"
  priority                    = 1003
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = var.node_port
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group.name
  network_security_group_name = azurerm_network_security_group.node_nsg.name
}

# create Client Network Interface
resource "azurerm_network_interface" "client_nic" {
  name                = "${var.instance_name}_client_nic"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name

  ip_configuration {
    name                          = "${var.instance_name}_client_ip_conf"
    subnet_id                     = azurerm_subnet.client_subnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = var.private_client_ip
    public_ip_address_id          = azurerm_public_ip.client_public_ip.id
  }

  tags = merge({
    Name     = "${var.instance_name}_client_nic"
    Instance = var.instance_name
  }, var.default_tags)
}

# Create Node Network Interface
resource "azurerm_network_interface" "node_nic" {
  name                = "${var.instance_name}_node_nic"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name

  ip_configuration {
    name                          = "${var.instance_name}_node_ip_conf"
    subnet_id                     = azurerm_subnet.node_subnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = var.private_node_ip
    public_ip_address_id          = azurerm_public_ip.node_public_ip.id
  }

  tags = merge({
    Name     = "${var.instance_name}_node_nic"
    Instance = var.instance_name
  }, var.default_tags)
}

# connect the primary security group to the primary network interface
resource "azurerm_network_interface_security_group_association" "association_client_nic" {
  network_interface_id      = azurerm_network_interface.client_nic.id
  network_security_group_id = azurerm_network_security_group.client_nsg.id
}

# connect the secondary security group to the secondary network interface
resource "azurerm_network_interface_security_group_association" "association_node_nic" {
  network_interface_id      = azurerm_network_interface.node_nic.id
  network_security_group_id = azurerm_network_security_group.node_nsg.id
}

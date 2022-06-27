# Create virtual machine
resource "azurerm_linux_virtual_machine" "indy_node" {
  name                  = var.instance_name
  location              = var.resource_group.location
  resource_group_name   = var.resource_group.name
  network_interface_ids = [azurerm_network_interface.client_nic.id, azurerm_network_interface.node_nic.id]
  size                  = "Standard_D2as_v4"

  os_disk {
    name                 = "${var.instance_name}_osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }

  computer_name                   = var.instance_name
  admin_username                  = "validatornode"
  disable_password_authentication = true

  admin_ssh_key {
    username   = "validatornode"
    public_key = var.public_ssh_key.content
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.storage.primary_blob_endpoint
  }

  tags = merge({
    Name     = var.instance_name
    Instance = var.instance_name
  }, var.default_tags)
}

# Generate random text for a unique storage account name
resource "random_id" "randomId" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = var.resource_group.name
  }

  byte_length = 6
}

# Create storage account for boot diagnostics
resource "azurerm_storage_account" "storage" {
  name                     = replace("${var.instance_name}-${random_id.randomId.hex}", "-", "")
  resource_group_name      = var.resource_group.name
  location                 = var.resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = merge({
    Name     = "${var.instance_name}-${random_id.randomId.hex}"
    Instance = var.instance_name
  }, var.default_tags)
}

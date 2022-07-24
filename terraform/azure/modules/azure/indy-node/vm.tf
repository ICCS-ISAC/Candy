# Create virtual machine
# ToDo:
#   - Add disk encryption?
#   - Set availability zone?
resource "azurerm_linux_virtual_machine" "indy_node" {
  name                  = var.instance_name
  location              = var.resource_group.location
  resource_group_name   = var.resource_group.name
  network_interface_ids = [azurerm_network_interface.client_nic.id, azurerm_network_interface.node_nic.id]
  size                  = var.instance_size

  os_disk {
    name                 = "${var.instance_name}_osdisk"
    caching              = var.os_disk.caching
    storage_account_type = var.os_disk.storage_account_type
  }

  source_image_reference {
    publisher = var.source_image_reference.publisher
    offer     = var.source_image_reference.offer
    sku       = var.source_image_reference.sku
    version   = var.source_image_reference.version
  }

  computer_name                   = var.instance_name
  admin_username                  = var.admin_username
  disable_password_authentication = true

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.public_ssh_key
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
  account_tier             = var.storage_account.account_tier
  account_replication_type = var.storage_account.account_replication_type

  tags = merge({
    Name     = "${var.instance_name}-${random_id.randomId.hex}"
    Instance = var.instance_name
  }, var.default_tags)
}

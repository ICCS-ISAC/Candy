# Note:
#   - When using elastic IP addresses, the limit is 5 per region
#     so, you are limited to 2 nodes using elastic IP addresses.
module "indy-node" {
  source = "./modules/azure/indy-node"

  count            = var.candy_instance_count
  instance_name    = "${var.candy_instance_name}-${count.index + 1}"
  application_name = var.candy_application_name
  environment      = var.candy_environment

  source_image_reference = var.candy_source_image_reference
  instance_size = var.candy_instance_size
  os_disk = var.candy_os_disk
  storage_account = var.candy_storage_account

  resource_group = azurerm_resource_group.resource_group

  admin_username     = var.candy_admin_username
  public_ssh_key     = var.candy_public_ssh_key
  ssh_source_address = var.candy_ssh_source_address

  vnet_address_range  = var.candy_vnet_address_range
  client_subnet_range = var.candy_client_subnet_range
  node_subnet_range   = var.candy_node_subnet_range

  private_client_ip = var.candy_private_client_ip
  client_port       = var.candy_client_port
  private_node_ip   = var.candy_private_node_ip
  node_port         = var.candy_node_port

  default_tags = {
    Application = var.candy_application_name
    Environment = var.candy_environment
  }
}

resource "azurerm_resource_group" "resource_group" {
  name     = var.candy_instance_name
  location = var.candy_region

  tags = {
    Name     = var.candy_instance_name
    Instance = var.candy_instance_name
    Application = var.candy_application_name
    Environment = var.candy_environment
  }
}
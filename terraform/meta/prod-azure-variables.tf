# Using this workspace for the CANdy-Prod Azure environment

# ===================================================
# General
# ---------------------------------------------------
resource "tfe_variable" "prod_azure_instance_count" {
  key          = "candy_instance_count"
  value        = 2
  category     = "terraform"
  workspace_id = data.tfe_workspace.prod-azure.id
}

resource "tfe_variable" "prod_azure_region" {
  key          = "candy_region"
  value        = "canadacentral"
  category     = "terraform"
  workspace_id = data.tfe_workspace.prod-azure.id
}

resource "tfe_variable" "prod_azure_application_name" {
  key          = "candy_application_name"
  value        = "candy"
  category     = "terraform"
  workspace_id = data.tfe_workspace.prod-azure.id
}

resource "tfe_variable" "prod_azure_environment" {
  key          = "candy_environment"
  value        = "prod"
  category     = "terraform"
  workspace_id = data.tfe_workspace.prod-azure.id
}

resource "tfe_variable" "prod_azure_instance_name" {
  key          = "candy_instance_name"
  value        = "prod-bc-azure"
  category     = "terraform"
  workspace_id = data.tfe_workspace.prod-azure.id
}

# ===================================================
# Instance Size
#   - Standard_D2as_v4 (for dev and test): 2CPU, 8GiB Memory
# ---------------------------------------------------
resource "tfe_variable" "prod_azure_instance_size" {
  key          = "candy_instance_size"
  value        = "Standard_D2as_v4"
  category     = "terraform"
  workspace_id = data.tfe_workspace.prod-azure.id
}

resource "tfe_variable" "prod_azure_os_disk" {
  key = "candy_os_disk"
  value = jsonencode({
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  })
  hcl          = true
  category     = "terraform"
  workspace_id = data.tfe_workspace.prod-azure.id
}

resource "tfe_variable" "prod_azure_source_image_reference" {
  key = "candy_source_image_reference"
  value = jsonencode({
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  })
  hcl          = true
  category     = "terraform"
  workspace_id = data.tfe_workspace.prod-azure.id
}

resource "tfe_variable" "prod_azure_storage_account" {
  key = "candy_storage_account"
  value = jsonencode({
    account_tier             = "Standard"
    account_replication_type = "LRS"
  })
  hcl          = true
  category     = "terraform"
  workspace_id = data.tfe_workspace.prod-azure.id
}

resource "tfe_variable" "prod_azure_admin_username" {
  key          = "candy_admin_username"
  value        = "validatornode"
  category     = "terraform"
  workspace_id = data.tfe_workspace.prod-azure.id
}
# ===================================================

# ===================================================
# Networking
# ---------------------------------------------------
resource "tfe_variable" "prod_azure_vnet_address_range" {
  key          = "candy_vnet_address_range"
  value        = "[\"10.0.0.0/16\"]"
  hcl          = true
  category     = "terraform"
  workspace_id = data.tfe_workspace.prod-azure.id
}

resource "tfe_variable" "prod_azure_client_subnet_range" {
  key          = "candy_client_subnet_range"
  value        = "[\"10.0.1.0/24\"]"
  hcl          = true
  category     = "terraform"
  workspace_id = data.tfe_workspace.prod-azure.id
}

resource "tfe_variable" "prod_azure_node_subnet_range" {
  key          = "candy_node_subnet_range"
  value        = "[\"10.0.2.0/24\"]"
  hcl          = true
  category     = "terraform"
  workspace_id = data.tfe_workspace.prod-azure.id
}

resource "tfe_variable" "prod_azure_private_client_ip" {
  key          = "candy_private_client_ip"
  value        = "10.0.1.5"
  category     = "terraform"
  workspace_id = data.tfe_workspace.prod-azure.id
}

resource "tfe_variable" "prod_azure_client_port" {
  key          = "candy_client_port"
  value        = "9702"
  category     = "terraform"
  workspace_id = data.tfe_workspace.prod-azure.id
}

resource "tfe_variable" "prod_azure_private_node_ip" {
  key          = "candy_private_node_ip"
  value        = "10.0.2.5"
  category     = "terraform"
  workspace_id = data.tfe_workspace.prod-azure.id
}

resource "tfe_variable" "prod_azure_node_port" {
  key          = "candy_node_port"
  value        = "9701"
  category     = "terraform"
  workspace_id = data.tfe_workspace.prod-azure.id
}
# ===================================================

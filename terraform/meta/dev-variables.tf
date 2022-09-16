# ===================================================
# General
# ---------------------------------------------------
resource "tfe_variable" "dev_instance_count" {
  key          = "candy_instance_count"
  value        = 1
  category     = "terraform"
  workspace_id = data.tfe_workspace.dev.id
}

resource "tfe_variable" "dev_use_elastic_ips" {
  key          = "candy_use_elastic_ips"
  value        = true
  category     = "terraform"
  workspace_id = data.tfe_workspace.dev.id
}

resource "tfe_variable" "dev_region" {
  key          = "candy_region"
  value        = "ca-central-1"
  category     = "terraform"
  workspace_id = data.tfe_workspace.dev.id
}

resource "tfe_variable" "dev_application_name" {
  key          = "candy_application_name"
  value        = "candy"
  category     = "terraform"
  workspace_id = data.tfe_workspace.dev.id
}

resource "tfe_variable" "dev_environment" {
  key          = "candy_environment"
  value        = "dev"
  category     = "terraform"
  workspace_id = data.tfe_workspace.dev.id
}

resource "tfe_variable" "dev_instance_name" {
  key          = "candy_instance_name"
  value        = "dev-bc"
  category     = "terraform"
  workspace_id = data.tfe_workspace.dev.id
}
# ===================================================

# ===================================================
# AMI
# ---------------------------------------------------
resource "tfe_variable" "dev_ami_owners" {
  key          = "candy_ami_owners"
  value        = "[\"099720109477\"]"
  hcl          = true
  category     = "terraform"
  workspace_id = data.tfe_workspace.dev.id
}

resource "tfe_variable" "dev_ami_filter_name" {
  key          = "candy_ami_filter_name"
  value        = "[\"*ubuntu-xenial-16.04-amd64-server-*\"]"
  hcl          = true
  category     = "terraform"
  workspace_id = data.tfe_workspace.dev.id
}

resource "tfe_variable" "dev_ami_filter_root_device_type" {
  key          = "candy_ami_filter_root_device_type"
  value        = "[\"ebs\"]"
  hcl          = true
  category     = "terraform"
  workspace_id = data.tfe_workspace.dev.id
}

resource "tfe_variable" "dev_ami_filter_virtualization_type" {
  key          = "candy_ami_filter_virtualization_type"
  value        = "[\"hvm\"]"
  hcl          = true
  category     = "terraform"
  workspace_id = data.tfe_workspace.dev.id
}
# ===================================================

# ===================================================
# EC2
#   - t3.large (for dev and test): 2CPU, 8GiB Memory
# ---------------------------------------------------
resource "tfe_variable" "dev_ec2_instance_type" {
  key          = "candy_ec2_instance_type"
  value        = "t3.large"
  category     = "terraform"
  workspace_id = data.tfe_workspace.dev.id
}
# ===================================================

# ===================================================
# EBS
# ---------------------------------------------------
resource "tfe_variable" "dev_root_volume_size" {
  key          = "candy_root_volume_size"
  value        = "20"
  category     = "terraform"
  workspace_id = data.tfe_workspace.dev.id
}

resource "tfe_variable" "dev_data_volume_size" {
  key          = "candy_data_volume_size"
  value        = "20"
  category     = "terraform"
  workspace_id = data.tfe_workspace.dev.id
}


resource "tfe_variable" "dev_ebs_volume_type" {
  key          = "candy_ebs_volume_type"
  value        = "gp2"
  category     = "terraform"
  workspace_id = data.tfe_workspace.dev.id
}

resource "tfe_variable" "dev_ebs_encrypted" {
  key          = "candy_ebs_encrypted"
  value        = true
  category     = "terraform"
  workspace_id = data.tfe_workspace.dev.id
}

resource "tfe_variable" "dev_ebs_kms_key_id" {
  key          = "candy_ebs_kms_key_id"
  value        = "18205e1b-9b4f-4df0-ab4e-a5b2c9de07a4"
  category     = "terraform"
  workspace_id = data.tfe_workspace.dev.id
}

resource "tfe_variable" "dev_ebs_delete_on_termination" {
  key          = "candy_ebs_delete_on_termination"
  value        = true
  category     = "terraform"
  workspace_id = data.tfe_workspace.dev.id
}
# ===================================================

# ===================================================
# Subnet
# ---------------------------------------------------
resource "tfe_variable" "dev_subnet_cidr_block_prefix" {
  key          = "candy_subnet_cidr_block_prefix"
  value        = "172.31."
  category     = "terraform"
  workspace_id = data.tfe_workspace.dev.id
}

resource "tfe_variable" "dev_subnet_cidr_starting_address" {
  key          = "candy_subnet_cidr_starting_address"
  value        = 100
  category     = "terraform"
  workspace_id = data.tfe_workspace.dev.id
}
# ===================================================

# ===================================================
# SG
# ---------------------------------------------------
resource "tfe_variable" "dev_sg_description" {
  key          = "candy_sg_description"
  value        = "Validator Node Security Group"
  category     = "terraform"
  workspace_id = data.tfe_workspace.dev.id
}
# ===================================================

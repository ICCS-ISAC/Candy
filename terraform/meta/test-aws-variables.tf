# ===================================================
# General
# ---------------------------------------------------
resource "tfe_variable" "test_aws_instance_count" {
  key          = "candy_instance_count"
  value        = 2
  category     = "terraform"
  workspace_id = data.tfe_workspace.test-aws.id
}

resource "tfe_variable" "test_aws_use_elastic_ips" {
  key          = "candy_use_elastic_ips"
  value        = true
  category     = "terraform"
  workspace_id = data.tfe_workspace.test-aws.id
}

resource "tfe_variable" "test_aws_region" {
  key          = "candy_region"
  value        = "ca-central-1"
  category     = "terraform"
  workspace_id = data.tfe_workspace.test-aws.id
}

resource "tfe_variable" "test_aws_application_name" {
  key          = "candy_application_name"
  value        = "candy"
  category     = "terraform"
  workspace_id = data.tfe_workspace.test-aws.id
}

resource "tfe_variable" "test_aws_environment" {
  key          = "candy_environment"
  value        = "test"
  category     = "terraform"
  workspace_id = data.tfe_workspace.test-aws.id
}

resource "tfe_variable" "test_aws_instance_name" {
  key          = "candy_instance_name"
  value        = "test-bc-aws"
  category     = "terraform"
  workspace_id = data.tfe_workspace.test-aws.id
}
# ===================================================

# ===================================================
# AMI
# ---------------------------------------------------
resource "tfe_variable" "test_aws_ami_owners" {
  key          = "candy_ami_owners"
  value        = "[\"099720109477\"]"
  hcl          = true
  category     = "terraform"
  workspace_id = data.tfe_workspace.test-aws.id
}

resource "tfe_variable" "test_aws_ami_filter_name" {
  key          = "candy_ami_filter_name"
  value        = "[\"ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*\"]"
  hcl          = true
  category     = "terraform"
  workspace_id = data.tfe_workspace.test-aws.id
}

resource "tfe_variable" "test_aws_ami_filter_root_device_type" {
  key          = "candy_ami_filter_root_device_type"
  value        = "[\"ebs\"]"
  hcl          = true
  category     = "terraform"
  workspace_id = data.tfe_workspace.test-aws.id
}

resource "tfe_variable" "test_aws_ami_filter_virtualization_type" {
  key          = "candy_ami_filter_virtualization_type"
  value        = "[\"hvm\"]"
  hcl          = true
  category     = "terraform"
  workspace_id = data.tfe_workspace.test-aws.id
}
# ===================================================

# ===================================================
# EC2
#   - t3.large (for dev and test): 2CPU, 8GiB Memory
# ---------------------------------------------------
resource "tfe_variable" "test_aws_ec2_instance_type" {
  key          = "candy_ec2_instance_type"
  value        = "t3.large"
  category     = "terraform"
  workspace_id = data.tfe_workspace.test-aws.id
}
# ===================================================

# ===================================================
# EBS
#   - 20G should be fine for dev.
# ---------------------------------------------------
resource "tfe_variable" "test_aws_ebs_volume_size" {
  key          = "candy_ebs_volume_size"
  value        = "20"
  category     = "terraform"
  workspace_id = data.tfe_workspace.test-aws.id
}

resource "tfe_variable" "test_aws_ebs_volume_type" {
  key          = "candy_ebs_volume_type"
  value        = "gp2"
  category     = "terraform"
  workspace_id = data.tfe_workspace.test-aws.id
}

resource "tfe_variable" "test_aws_ebs_encrypted" {
  key          = "candy_ebs_encrypted"
  value        = true
  category     = "terraform"
  workspace_id = data.tfe_workspace.test-aws.id
}

resource "tfe_variable" "test_aws_ebs_kms_key_id" {
  key          = "candy_ebs_kms_key_id"
  value        = ""
  category     = "terraform"
  workspace_id = data.tfe_workspace.test-aws.id
}

resource "tfe_variable" "test_aws_ebs_delete_on_termination" {
  key          = "candy_ebs_delete_on_termination"
  value        = true
  category     = "terraform"
  workspace_id = data.tfe_workspace.test-aws.id
}
# ===================================================

# ===================================================
# Subnet
# ---------------------------------------------------
resource "tfe_variable" "test_aws_subnet_cidr_block_prefix" {
  key          = "candy_subnet_cidr_block_prefix"
  value        = "172.31."
  category     = "terraform"
  workspace_id = data.tfe_workspace.test-aws.id
}

resource "tfe_variable" "test_aws_subnet_cidr_starting_address" {
  key          = "candy_subnet_cidr_starting_address"
  value        = 100
  category     = "terraform"
  workspace_id = data.tfe_workspace.test-aws.id
}
# ===================================================

# ===================================================
# SG
# ---------------------------------------------------
resource "tfe_variable" "test_aws_sg_description" {
  key          = "candy_sg_description"
  value        = "Validator Node Security Group"
  category     = "terraform"
  workspace_id = data.tfe_workspace.test-aws.id
}
# ===================================================

# ===================================================
# Networking
# ---------------------------------------------------
resource "tfe_variable" "test_aws_client_port" {
  key          = "candy_client_port"
  value        = "9702"
  category     = "terraform"
  workspace_id = data.tfe_workspace.test-aws.id
}

resource "tfe_variable" "test_aws_node_port" {
  key          = "candy_node_port"
  value        = "9701"
  category     = "terraform"
  workspace_id = data.tfe_workspace.test-aws.id
}
# ===================================================
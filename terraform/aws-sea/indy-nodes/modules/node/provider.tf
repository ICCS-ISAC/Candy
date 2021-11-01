# ===================================================
# ===================================================
# Configure the aws provider
# ---------------------------------------------------
provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile_node
  default_tags {
    tags = {
      Application = var.aws_application
      Environment = var.aws_environment
      Instance    = var.aws_instance_name
    }
  }
}
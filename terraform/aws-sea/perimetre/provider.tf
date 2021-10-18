terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.61.0"
    }
  }

  required_version = ">= 0.14.9"
}

#-------------------------------------------------------------------------------
# Configure the aws provider
provider "aws" {
  region  = var.candy_region
  profile = var.candy_profile
  default_tags {
    tags = {
      system      = var.candy_application
      environment = var.candy_environment
    }
  }
}
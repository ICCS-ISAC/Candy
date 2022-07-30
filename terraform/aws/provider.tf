terraform {
  backend "remote" {
    organization = "ReplaceWithYourOrgName"
    workspaces {
      prefix = "candy-"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  required_version = "~> 1.0"
}

provider "aws" {
  region = var.candy_region

  assume_role {
    role_arn     = var.assume_role
    session_name = "terraform-cloud"
  }

  default_tags {
    tags = {
      Application = var.candy_application_name
      Environment = var.candy_environment
    }
  }
}

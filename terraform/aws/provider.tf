terraform {
  backend "remote" {
    organization = "bcgov"
    workspaces {
      prefix = "candy-"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.61.0"
    }
  }

  required_version = ">= 0.14.9"
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

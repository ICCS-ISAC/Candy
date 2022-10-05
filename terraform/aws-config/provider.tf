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
      version = "~> 4.0"
    }
  }

  required_version = "~> 1.0"
}

provider "aws" {
  region = var.candy_region

  default_tags {
    tags = {
      Application = var.candy_application_name
    }
  }
}

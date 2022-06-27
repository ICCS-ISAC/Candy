# Configure the Azure provider
terraform {
  backend "remote" {
    organization = "bcgov"
    workspaces {
      prefix = "candy-"
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.0.9"
}

provider "azurerm" {
  features {}
}
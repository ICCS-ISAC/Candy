terraform {
  backend "remote" {
    organization = "bcgov"
    workspaces {
      prefix = "candy-"
    }
  }

  required_version = ">= 1.0.9"
}

provider "tfe" {
}
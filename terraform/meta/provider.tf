terraform {
  backend "remote" {
    organization = "bcgov"
    workspaces {
      prefix = "candy-"
    }
  }

  required_version = ">= 0.14.9"
}

provider "tfe" {
}
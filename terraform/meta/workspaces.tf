data "tfe_workspace" "alpha" {
  name         = "candy-alpha"
  organization = "bcgov"
}

data "tfe_workspace" "beta" {
  name         = "candy-beta"
  organization = "bcgov"
}

data "tfe_workspace" "dev" {
  name         = "candy-dev"
  organization = "bcgov"
}

data "tfe_workspace" "test-aws" {
  name         = "candy-test-aws"
  organization = "bcgov"
}

data "tfe_workspace" "test-azure" {
  name         = "candy-test-azure"
  organization = "bcgov"
}

data "tfe_workspace" "prod-aws" {
  name         = "candy-prod-aws"
  organization = "bcgov"
}

data "tfe_workspace" "prod-azure" {
  name         = "candy-prod-azure"
  organization = "bcgov"
}
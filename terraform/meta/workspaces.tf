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

data "tfe_workspace" "test" {
  name         = "candy-test"
  organization = "bcgov"
}

data "tfe_workspace" "prod" {
  name         = "candy-prod"
  organization = "bcgov"
}
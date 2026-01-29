data "terraform_remote_state" "this" {
  backend = "remote"

  config = {
    organization = var.organization_name
    workspaces = {
      name = var.workspace_name
    }
  }
}

data "tfe_outputs" "this" {
  organization = var.organization_name
  workspace    = var.workspace_name
}
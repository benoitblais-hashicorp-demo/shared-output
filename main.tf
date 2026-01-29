data "terraform_remote_state" "this" {
  count   = var.enable_terraform_remote_state ? 1 : 0
  backend = "remote"

  config = {
    organization = var.organization_name
    workspaces = {
      name = var.workspace_name
    }
  }
}

data "tfe_outputs" "this" {
  count        = var.enable_tfe_outputs ? 1 : 0
  organization = var.organization_name
  workspace    = var.workspace_name
}

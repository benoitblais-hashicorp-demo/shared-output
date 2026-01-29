data "terraform_remote_state" "data" {
  backend = "remote"

  config = {
    organization = var.organization_name
    workspaces = {
      name = var.workspace_name
    }
  }
}
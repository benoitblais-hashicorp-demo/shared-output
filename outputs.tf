output "terraform_remote_state" {
  description = "Value from the `terraform_remote_state` data source."
  value       = data.terraform_remote_state.this.outputs.uuid
}

output "tfe_outputs" {
  description = "Value from the `tfe_outputs` data source."
  value       = nonsensitive(data.tfe_outputs.this.values.uuid)
}

output "files_in_cwd" {
  description = "A list of files in the current working directory."
  value       = fileset(path.cwd, "*")
}

output "directory_listing" {
  description = "Complete recursive directory listing including hidden files and directories (ls -laR output)."
  value       = data.external.list_directory.result.output
}

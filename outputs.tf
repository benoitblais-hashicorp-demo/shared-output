output "terraform_remote_state" {
  description = "Value from the `terraform_remote_state` data source."
  value       = data.terraform_remote_state.this.outputs.uuid
}

output "tfe_outputs" {
  description = "Value from the `tfe_outputs` data source."
  value       = data.tfe_outputs.this.outputs.uuid
}

output "files_in_cwd" {
  description = "A list of files in the current working directory."
  value       = fileset(path.cwd, "*")
}
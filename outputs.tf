output "data" {
  description = "Value from the remote state data source."
  value       = data.terraform_remote_state.data.outputs.uuid
}

output "files_in_cwd" {
  description = "A list of files in the current working directory."
  value       = fileset(path.cwd, "*")
}
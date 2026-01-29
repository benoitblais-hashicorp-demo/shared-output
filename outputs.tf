output "terraform_remote_state" {
  description = "Value from the `terraform_remote_state` data source."
  value       = var.enable_terraform_remote_state ? data.terraform_remote_state.this[0].outputs.uuid : "Not enabled - set enable_terraform_remote_state = true"
}

output "tfe_outputs" {
  description = "Value from the `tfe_outputs` data source."
  value       = var.enable_tfe_outputs ? nonsensitive(data.tfe_outputs.this[0].values.uuid) : "Not enabled - set enable_tfe_outputs = true"
}

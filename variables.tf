variable "organization_name" {
  description = "(Required) The name of the HCP Terraform organization."
  type        = string
  nullable    = false
}

variable "workspace_name" {
  description = "(Required) The name of the HCP Terraform workspace."
  type        = string
  nullable    = false
}

variable "enable_terraform_remote_state" {
  description = "(Optional) Enable reading outputs using the terraform_remote_state data source."
  type        = bool
  default     = false
}

variable "enable_tfe_outputs" {
  description = "(Optional) Enable reading outputs using the tfe_outputs data source."
  type        = bool
  default     = false
}
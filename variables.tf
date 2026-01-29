variable "organization_name" {
  description = "(Optional) The name of the HCP Terraform organization."
  type        = string
  default     = "benoitblais-hashicorp"
}

variable "workspace_name" {
  description = "(Optional) The name of the HCP Terraform workspace."
  type        = string
  default     = "terraform-renovate"
}
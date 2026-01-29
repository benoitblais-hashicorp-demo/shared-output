# shared-output
Repository to run demo of Terraform tfe_output and terraform_remote_state

<!-- BEGIN_TF_DOCS -->
# Read Remote State Demo

This demo demonstrates two methods for reading remote state data in Terraform: using the `terraform_remote_state` data source and the `tfe_outputs` data source. Both approaches allow you to reference outputs from another workspace, enabling secure and efficient data sharing between Terraform configurations without hardcoding values or relying on external configuration management tools.

To use this demo, you'll need access to another Terraform workspace that exports outputs (e.g., a networking or infrastructure workspace). Configure the variables to point to your source workspace, and this configuration will demonstrate how to consume those outputs.

## What This Demo Demonstrates

Key Integration Points:

- **Remote Terraform Workspaces**: Connects to existing workspaces to consume their state outputs
- **HCP Terraform API**: Leverages the TFE provider to access workspace outputs programmatically
- **Terraform Backend System**: Utilizes the remote state data source for cross-workspace communication
- **Organization State Storage**: Reads from centralized state management in HCP Terraform
- **Authentication Layer**: Integrates with HCP Terraform's token-based authentication for secure access
- **Workspace Permissions**: Respects and requires appropriate read permissions on source workspaces

## Demo Components

This demonstration includes:

1. **Terraform Configuration Files**:
   - `main.tf` - Contains data sources for reading remote state using both methods
   - `variables.tf` - Configurable inputs for workspace identification and connection
   - `outputs.tf` - Exposes the retrieved remote state values for verification

2. **Required Variables**:
   - `organization` - Your HCP Terraform organization name
   - `remote_workspace_name` - The name of the workspace whose outputs you want to read
   - `tfe_token` - (Optional) Authentication token for HCP Terraform API access

3. **Data Sources**:
   - `terraform_remote_state` - Traditional approach for reading remote state
   - `tfe_outputs` - HCP Terraform-native approach with enhanced features

## How Remote State Sharing Works in This Demo

Remote state sharing enables loosely-coupled infrastructure modules to communicate without direct dependencies. This demo illustrates both traditional and modern approaches to accessing remote state data, allowing you to compare their implementation and understand when to use each method.

### The Workflow

This demo follows a standard remote state consumption pattern:

1. **Source Workspace Setup**:
   - Another workspace in your organization (e.g., `networking-infrastructure`, `vpc-foundation`) runs Terraform and produces outputs
   - Common outputs include VPC IDs, subnet IDs, security group IDs, or any exported values
   - The source workspace must complete at least one successful `terraform apply` to generate state

2. **State Storage and Sharing**:
   - HCP Terraform securely stores the complete state file including all defined outputs
   - For `terraform_remote_state`: The source workspace must have **"Share state globally"** enabled in workspace settings
   - For `tfe_outputs`: You need read permissions on the source workspace (no global sharing required)

3. **Consumer Configuration** (This Demo):
   - This workspace configures two data sources pointing to the same source workspace
   - Variables specify the organization name and remote workspace name
   - Both data sources will fetch the same outputs using different methods

4. **Authentication and Authorization**:
   - HCP Terraform validates your credentials and permissions
   - Checks workspace access rights before allowing state reads
   - Uses your HCP Terraform token for API authentication

5. **Data Retrieval**:
   - `terraform_remote_state` accesses the backend state directly
   - `tfe_outputs` queries the HCP Terraform API for workspace outputs
   - Outputs become available as data source attributes (e.g., `data.terraform_remote_state.example.outputs.vpc_id`)

6. **Output Display**:
   - Retrieved values are exposed through this workspace's outputs
   - Allows side-by-side comparison of results from both methods
   - Validates that both approaches return identical data

### Prerequisites and Configuration

To successfully run this demo, ensure you have:

1. **A Source Workspace** with:
   - Defined outputs in its configuration
   - At least one successful `terraform apply` completed
   - For `terraform_remote_state`: "Share state globally" enabled in workspace settings
   - For `tfe_outputs`: Your user/team has read access to the workspace

2. **Required Variables Configured**:
   - `organization` - Your HCP Terraform organization name
   - `remote_workspace_name` - The name of the source workspace
   - Optionally: `tfe_token` for explicit authentication

3. **Authentication**:
   - Valid HCP Terraform credentials via `TFE_TOKEN` environment variable
   - Or configured in the TFE provider block
   - Token must have read access to the source workspace

4. **Network Access**:
   - Connectivity to `app.terraform.io` or your HCP Terraform Enterprise instance
   - Proper firewall rules if running in a restricted environment

## Demo Value Proposition

This demo provides value by:

- **Eliminating Hardcoded Values**: No need to manually copy/paste resource IDs between workspaces
- **Reducing Configuration Drift**: Changes in the source workspace automatically propagate to consumers
- **Improving Security**: Centralized state management with role-based access controls
- **Enabling Modular Infrastructure**: Build independent, reusable modules that communicate through outputs
- **Facilitating Team Collaboration**: Different teams can own different workspaces while sharing necessary data
- **Comparison Learning**: Understand the differences between methods to choose the right approach

## Expected Behavior

When you run this configuration:

- ✅ Both data sources successfully retrieve remote outputs
- ✅ Output values match between `terraform_remote_state` and `tfe_outputs`
- ✅ No authentication or permission errors
- ✅ Changes in the source workspace reflect in subsequent runs

## Documentation

## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.7.5)

- <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) (>= 0.73.0)

## Modules

No modules.

## Required Inputs

No required inputs.

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_organization_name"></a> [organization\_name](#input\_organization\_name)

Description: (Optional) The name of the HCP Terraform organization.

Type: `string`

Default: `"benoitblais-hashicorp"`

### <a name="input_workspace_name"></a> [workspace\_name](#input\_workspace\_name)

Description: (Optional) The name of the HCP Terraform workspace.

Type: `string`

Default: `"terraform-renovate"`

## Resources

The following resources are used by this module:

- [external_external.list_directory](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) (data source)
- [terraform_remote_state.this](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) (data source)
- [tfe_outputs.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/outputs) (data source)

## Outputs

The following outputs are exported:

### <a name="output_directory_listing"></a> [directory\_listing](#output\_directory\_listing)

Description: Complete recursive directory listing including hidden files and directories (ls -laR output).

### <a name="output_files_in_cwd"></a> [files\_in\_cwd](#output\_files\_in\_cwd)

Description: A list of files in the current working directory.

### <a name="output_terraform_remote_state"></a> [terraform\_remote\_state](#output\_terraform\_remote\_state)

Description: Value from the `terraform_remote_state` data source.

### <a name="output_tfe_outputs"></a> [tfe\_outputs](#output\_tfe\_outputs)

Description: Value from the `tfe_outputs` data source.

<!-- markdownlint-enable -->
<!-- END_TF_DOCS -->
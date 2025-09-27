# Azure Infrastructure with Terraform

This directory contains Terraform configuration files to deploy the SecureWebApp infrastructure to Azure.

## Prerequisites

1. **Install Terraform** (if not already installed):
   ```bash
   # On Windows (with winget)
   winget install Hashicorp.Terraform
   
   # On macOS (with Homebrew)
   brew install terraform
   
   # On Linux
   curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
   sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
   sudo apt-get update && sudo apt-get install terraform
   ```

2. **Azure CLI** configured with appropriate permissions
3. **Authenticated Azure session** (`az login`)

## Files Description

- `main.tf` - Main Terraform configuration with resources
- `variables.tf` - Variable declarations
- `outputs.tf` - Output values
- `terraform.tfvars` - Variable values (customize as needed)

## Resources Created

- **Resource Group**: Contains all resources
- **App Service Plan**: Linux-based plan for hosting the web app
- **Linux Web App**: Main application with .NET 8.0 runtime
- **Staging Slot**: For blue-green deployments
- **Key Vault**: For secure storage of secrets
- **Key Vault Secret**: Sample database password

## Deployment Steps

### Option 1: Manual Deployment

1. Navigate to the infra directory:
   ```bash
   cd infra
   ```

2. Initialize Terraform:
   ```bash
   terraform init
   ```

3. Validate the configuration:
   ```bash
   terraform validate
   ```

4. Plan the deployment:
   ```bash
   terraform plan
   ```

5. Apply the configuration:
   ```bash
   terraform apply
   ```

### Option 2: GitHub Actions (Automated)

The workflow is configured to automatically run Terraform when you push to the main branch. Make sure you have the following GitHub secrets configured:

- `AZURE_CREDENTIALS` - Azure service principal credentials
- `AZURE_WEBAPP_NAME` - Name of your web app (should match `app_name` in terraform.tfvars)
- `AZURE_RG` - Resource group name (should match `resource_group_name` in terraform.tfvars)
- `KV_NAME` - Key Vault name (should match `key_vault_name` in terraform.tfvars)
- `APPROVERS` - GitHub usernames for manual approval (comma-separated) this is usually the username of your account

## Customization

Edit the `terraform.tfvars` file to customize:

- Resource names
- Azure region
- App Service Plan SKU
- Tags
- Database password

## Outputs

After deployment, Terraform will output:

- Resource Group name
- App Service name and URL
- Staging slot URL
- Key Vault name and URI

## Cleanup

To destroy all resources:

```bash
cd infra
terraform destroy
```

## Troubleshooting

1. **Authentication Issues**: Make sure you're logged into Azure CLI (`az login`)
2. **Permission Issues**: Ensure your Azure account has Contributor role on the subscription
3. **Name Conflicts**: Azure resource names must be globally unique - modify names in terraform.tfvars
4. **Key Vault Issues**: Key Vault names are globally unique and have a purge protection period

## Security Notes

- The `terraform.tfvars` file contains sensitive information - consider using environment variables for production
- Key Vault is configured with soft delete enabled
- Access policies are configured for the current user - modify as needed for production
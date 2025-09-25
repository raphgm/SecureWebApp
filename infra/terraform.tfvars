# Terraform values for SecureWebApp
# You can customize these values as needed

resource_group_name = "SecureRG"
location           = "East US"
app_name           = "securewebapp3390"
key_vault_name     = "kv-securewebapp3390"
app_service_sku    = "B1"
db_password        = "SecurePassword123!"

tags = {
  Environment = "Development"
  Application = "SecureWebApp"
  ManagedBy   = "Terraform"
}
# Terraform values for SecureWebApp
# You can customize these values as needed

resource_group_name = "SecureRG"
location           = "East US"
app_name           = "securewebapp6290"
key_vault_name     = "kv-securewebapp6290"
app_service_sku    = "B1"
db_password        = "SecurePassword123!"

tags = {
  Environment = "Development"
  Application = "SecureWebApp"
  ManagedBy   = "Terraform"
}
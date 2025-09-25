# Variables for SecureWebApp infrastructure

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "SecureRG"
}

variable "location" {
  description = "Azure region where resources will be created"
  type        = string
  default     = "East US"
}

variable "app_name" {
  description = "Name of the web application"
  type        = string
  default     = "securewebapp6290"
}

variable "key_vault_name" {
  description = "Name of the Key Vault"
  type        = string
  default     = "kv-securewebapp6290"
}

variable "app_service_sku" {
  description = "SKU for the App Service Plan"
  type        = string
  default     = "B1"
}

variable "db_password" {
  description = "Database password to store in Key Vault"
  type        = string
  sensitive   = true
  default     = "SecurePassword123!"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default = {
    Environment = "Development"
    Application = "SecureWebApp"
    ManagedBy   = "Terraform"
  }
}
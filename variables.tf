variable "server_name" {
  description = "Name of the SQL server (must be globally unique)"
  type        = string
  validation {
    condition     = length(var.server_name) >= 1 && length(var.server_name) <= 63 && can(regex("^[a-z0-9-]+$", var.server_name))
    error_message = "Server name must be 1-63 characters, containing only lowercase letters, numbers, and hyphens."
  }
}

variable "database_name" {
  description = "Name of the SQL database"
  type        = string
  validation {
    condition     = length(var.database_name) > 0
    error_message = "Database name must not be empty."
  }
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  validation {
    condition     = length(var.resource_group_name) > 0
    error_message = "Resource group name must not be empty."
  }
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "westus2"
  validation {
    condition     = length(var.location) > 0
    error_message = "Location must not be empty."
  }
}

variable "admin_login" {
  description = "Administrator login for the SQL server"
  type        = string
  validation {
    condition     = length(var.admin_login) > 0 && !contains(["admin", "sa", "administrator", "root"], lower(var.admin_login))
    error_message = "Admin login must not be empty and cannot be a reserved name like 'admin' or 'sa'."
  }
}

variable "admin_password" {
  description = "Administrator password for the SQL server"
  type        = string
  sensitive   = true
  validation {
    condition     = length(var.admin_password) >= 8 && can(regex("[A-Z]", var.admin_password)) && can(regex("[a-z]", var.admin_password)) && can(regex("[0-9]", var.admin_password))
    error_message = "Password must be at least 8 characters long and contain uppercase, lowercase, and numeric characters."
  }
}

variable "sku_name" {
  description = "SKU name for the database (e.g., Basic, S0, S1, GP_S_Gen5_1)"
  type        = string
  default     = "Basic"
  validation {
    condition     = length(var.sku_name) > 0
    error_message = "SKU name must not be empty."
  }
}

variable "max_size_gb" {
  description = "Maximum size of the database in GB"
  type        = number
  default     = 2
  validation {
    condition     = var.max_size_gb > 0
    error_message = "Maximum size must be greater than 0."
  }
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}

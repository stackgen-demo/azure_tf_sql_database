variable "server_name" {
  description = "Name of the SQL server (must be globally unique)"
  type        = string
}

variable "database_name" {
  description = "Name of the SQL database"
  type        = string
  default     = "workshopdb"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "se-rg"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "westus2"
}

variable "admin_login" {
  description = "Administrator login for the SQL server"
  type        = string
}

variable "admin_password" {
  description = "Administrator password for the SQL server"
  type        = string
  sensitive   = true
}

variable "sku_name" {
  description = "SKU name for the database (e.g., Basic, S0, S1, GP_S_Gen5_1)"
  type        = string
  default     = "Basic"
}

variable "max_size_gb" {
  description = "Maximum size of the database in GB"
  type        = number
  default     = 2
}

variable "monthly_retention" {
  description = "Monthly long-term backup retention as an ISO 8601 duration (for example, P13M for 13 months)"
  type        = string
  default     = null

  validation {
    condition     = var.monthly_retention == null || can(regex("^P(?:[1-9]|[1-9][0-9]|1[01][0-9]|120)M$", var.monthly_retention))
    error_message = "monthly_retention must be null or an ISO 8601 duration from P1M through P120M."
  }
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}

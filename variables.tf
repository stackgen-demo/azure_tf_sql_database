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

variable "zone_redundant" {
  description = "Whether the database is zone redundant (spans multiple Availability Zones). Only supported on Premium and Business Critical service tiers, and General Purpose / Hyperscale tiers in supported regions."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}

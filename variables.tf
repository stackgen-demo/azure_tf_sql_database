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

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "long_term_retention_enabled" {
  description = "Whether to enable the Long-Term Retention (LTR) policy on the SQL database."
  type        = bool
  default     = true
}

variable "long_term_retention_weekly" {
  description = "Weekly LTR retention (ISO 8601 duration, e.g. P12W). Optional."
  type        = string
  default     = null
}

variable "long_term_retention_monthly" {
  description = "Monthly LTR retention (ISO 8601 duration). Defaults to P13M (13 months) per requirement."
  type        = string
  default     = "P13M"
}

variable "long_term_retention_yearly" {
  description = "Yearly LTR retention (ISO 8601 duration, e.g. P5Y). Optional."
  type        = string
  default     = null
}

variable "long_term_retention_week_of_year" {
  description = "Week of year (1-52) for the yearly LTR backup. Required by Azure if long_term_retention_yearly is set."
  type        = number
  default     = null
}

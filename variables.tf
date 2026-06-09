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

# --- Long-Term Retention (LTR) policy ---
# Default policy retains monthly backups for 13 months to satisfy long-term
# data retention requirements. ISO 8601 duration format (e.g., P13M = 13 months).
variable "ltr_weekly_retention" {
  description = "Weekly LTR retention duration in ISO 8601 format (e.g., P1W). Use PT0S to disable."
  type        = string
  default     = "PT0S"
}

variable "ltr_monthly_retention" {
  description = "Monthly LTR retention duration in ISO 8601 format. Defaults to 13 months (P13M)."
  type        = string
  default     = "P13M"
}

variable "ltr_yearly_retention" {
  description = "Yearly LTR retention duration in ISO 8601 format (e.g., P5Y). Use PT0S to disable."
  type        = string
  default     = "PT0S"
}

variable "ltr_week_of_year" {
  description = "Week of the year (1-52) to take the yearly LTR backup. Required when yearly_retention is set; ignored otherwise."
  type        = number
  default     = 1
}

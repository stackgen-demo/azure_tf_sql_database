variable "enabled" {
  description = "Whether to enable the Long-Term Retention (LTR) policy. Exposed for consumers that conditionally wire the policy block."
  type        = bool
  default     = true
}

variable "database_id" {
  description = "Optional ID of the Azure SQL Database the LTR policy applies to. Informational only — with this azurerm provider build, LTR is set via the nested long_term_retention_policy block on azurerm_mssql_database."
  type        = string
  default     = null
}

variable "weekly_retention" {
  description = "Weekly backup retention period (ISO 8601 duration, e.g. P12W). Optional."
  type        = string
  default     = null
}

variable "monthly_retention" {
  description = "Monthly backup retention period (ISO 8601 duration, e.g. P13M for 13 months). Defaults to 13 months."
  type        = string
  default     = "P13M"
}

variable "yearly_retention" {
  description = "Yearly backup retention period (ISO 8601 duration, e.g. P5Y). Optional."
  type        = string
  default     = null
}

variable "week_of_year" {
  description = "Week of year (1-52) for the yearly backup. Required by Azure if yearly_retention is set."
  type        = number
  default     = null
}

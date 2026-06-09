output "enabled" {
  description = "Whether the Long-Term Retention (LTR) policy is enabled."
  value       = var.enabled
}

output "policy" {
  description = "Long-Term Retention policy values to be applied to the long_term_retention_policy block of azurerm_mssql_database."
  value       = local.policy
}

output "weekly_retention" {
  description = "Weekly retention (ISO 8601 duration)."
  value       = var.weekly_retention
}

output "monthly_retention" {
  description = "Monthly retention (ISO 8601 duration). Defaults to P13M (13 months)."
  value       = var.monthly_retention
}

output "yearly_retention" {
  description = "Yearly retention (ISO 8601 duration)."
  value       = var.yearly_retention
}

output "week_of_year" {
  description = "Week of year used for yearly backup."
  value       = var.week_of_year
}

# Long-Term Retention (LTR) configuration module.
#
# Note: With this azurerm provider build, LTR is configured via the
# nested `long_term_retention_policy` block on the `azurerm_mssql_database`
# resource (no standalone resource type is available).
#
# This module centralises and exposes the LTR settings (defaulting to 13
# months of monthly retention) so that they can be wired into the database
# resource via the `policy` output, e.g.:
#
#   resource "azurerm_mssql_database" "this" {
#     ...
#     dynamic "long_term_retention_policy" {
#       for_each = var.enable_ltr ? [module.long_term_retention.policy] : []
#       content {
#         weekly_retention  = long_term_retention_policy.value.weekly_retention
#         monthly_retention = long_term_retention_policy.value.monthly_retention
#         yearly_retention  = long_term_retention_policy.value.yearly_retention
#         week_of_year      = long_term_retention_policy.value.week_of_year
#       }
#     }
#   }

locals {
  policy = {
    weekly_retention  = var.weekly_retention
    monthly_retention = var.monthly_retention
    yearly_retention  = var.yearly_retention
    week_of_year      = var.week_of_year
  }
}

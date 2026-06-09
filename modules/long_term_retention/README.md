# long_term_retention

Centralises Long-Term Retention (LTR) policy settings for an Azure SQL
Database, defaulting to **13 months** of monthly retention (`P13M`).

With the azurerm provider build in use here, LTR is configured via the
nested `long_term_retention_policy` block on the `azurerm_mssql_database`
resource (there is no standalone LTR resource type). This module therefore
exposes the policy values via outputs so they can be wired into the
database resource.

## Usage

```hcl
module "long_term_retention" {
  source = "./modules/long_term_retention"

  # Defaults to 13 months — override as needed.
  monthly_retention = "P13M"
}

resource "azurerm_mssql_database" "this" {
  # ... other arguments ...

  dynamic "long_term_retention_policy" {
    for_each = module.long_term_retention.enabled ? [module.long_term_retention.policy] : []
    content {
      weekly_retention  = long_term_retention_policy.value.weekly_retention
      monthly_retention = long_term_retention_policy.value.monthly_retention
      yearly_retention  = long_term_retention_policy.value.yearly_retention
      week_of_year      = long_term_retention_policy.value.week_of_year
    }
  }
}
```

## Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| enabled | Whether to wire the LTR policy. | bool | true |
| database_id | Optional, informational. | string | null |
| weekly_retention | ISO 8601 weekly retention. | string | null |
| monthly_retention | ISO 8601 monthly retention. | string | "P13M" |
| yearly_retention | ISO 8601 yearly retention. | string | null |
| week_of_year | Week (1-52) for yearly backup. | number | null |

## Outputs

| Name | Description |
|------|-------------|
| enabled | Whether the policy is enabled. |
| policy | Object with all LTR block values, ready for the nested block. |
| weekly_retention | Pass-through. |
| monthly_retention | Pass-through. |
| yearly_retention | Pass-through. |
| week_of_year | Pass-through. |

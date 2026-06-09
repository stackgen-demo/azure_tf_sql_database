# azure_tf_sql_database

Terraform module that provisions an Azure SQL Server, a SQL Database, and a
firewall rule allowing Azure services.

## Features

- Azure SQL Server (TLS 1.2 minimum)
- Azure SQL Database with configurable SKU and size
- Firewall rule allowing Azure services
- **Long-Term Retention (LTR) policy** — retains monthly backups for 13 months by default

## Long-Term Retention Policy

The module configures an LTR policy on the `azurerm_mssql_database` resource.
By default, monthly backups are retained for **13 months** (`P13M`), satisfying
common long-term data retention requirements (e.g., year-over-year reporting).

Durations use ISO 8601 format:

| Variable                 | Default | Meaning                                  |
|--------------------------|---------|------------------------------------------|
| `ltr_weekly_retention`   | `PT0S`  | Weekly backup retention (disabled)       |
| `ltr_monthly_retention`  | `P13M`  | Monthly backup retention (13 months)     |
| `ltr_yearly_retention`   | `PT0S`  | Yearly backup retention (disabled)       |
| `ltr_week_of_year`       | `1`     | Week-of-year for yearly backup (1-52)    |

To override, e.g. to also keep 5 yearly backups:

```hcl
module "sql" {
  source = "./azure_tf_sql_database"
  # ...
  ltr_monthly_retention = "P13M"
  ltr_yearly_retention  = "P5Y"
  ltr_week_of_year      = 1
}
```

## Inputs

See `variables.tf` for the full list of inputs.

## Outputs

See `outputs.tf` for the full list of outputs.

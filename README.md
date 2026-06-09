# SQL Database Module

Creates an Azure SQL Server and Database with a firewall rule allowing Azure services.

## Usage

```hcl
module "sql" {
  source = "./modules/sql_database"

  server_name         = "my-sql-server-123"
  database_name       = "mydb"
  resource_group_name = "se-rg"
  location            = "eastus"
  admin_login         = "sqladmin"
  admin_password      = "P@ssw0rd1234!"
  sku_name            = "Basic"

  tags = {
    environment = "workshop"
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| server_name | SQL server name (globally unique) | string | — | yes |
| database_name | Database name | string | — | yes |
| resource_group_name | Resource group name | string | — | yes |
| location | Azure region | string | — | yes |
| admin_login | SQL admin username | string | — | yes |
| admin_password | SQL admin password | string | — | yes |
| sku_name | Database SKU | string | `Basic` | no |
| max_size_gb | Max DB size in GB | number | `2` | no |
| tags | Resource tags | map(string) | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| server_id | SQL server resource ID |
| server_fqdn | SQL server FQDN |
| database_id | Database resource ID |
| database_name | Database name |
| connection_string | ADO.NET connection string (sensitive) |
Added LTR submodule scaffolding (modules/long_term_retention) with default 13-month retention.

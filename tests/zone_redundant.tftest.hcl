# Unit tests for the zone_redundant variable on the SQL database module.
# Uses mock_provider for azurerm so no real cloud calls are made.

mock_provider "azurerm" {}

variables {
  server_name    = "test-sql-server-xyz"
  database_name  = "testdb"
  admin_login    = "sqladmin"
  admin_password = "P@ssw0rd1234!"
}

run "zone_redundant_defaults_to_false" {
  command = plan

  assert {
    condition     = var.zone_redundant == false
    error_message = "zone_redundant must default to false to preserve existing behaviour."
  }

  assert {
    condition     = azurerm_mssql_database.this.zone_redundant == false
    error_message = "azurerm_mssql_database.this.zone_redundant should be false when the variable is unset."
  }
}

run "zone_redundant_can_be_enabled" {
  command = plan

  variables {
    zone_redundant = true
    sku_name       = "P1"
  }

  assert {
    condition     = azurerm_mssql_database.this.zone_redundant == true
    error_message = "azurerm_mssql_database.this.zone_redundant should be true when var.zone_redundant = true."
  }
}

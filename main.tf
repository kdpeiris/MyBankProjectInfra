terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.55.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create Resource Group
resource "azurerm_resource_group" "mybankprojectRG" {
  name     = var.resource_group_name
  location = var.resource_group_location
  tags     = var.project_tags
}

# Create Service Plan
resource "azurerm_service_plan" "mybankprojectAppSvcPlan" {
  name                = var.service_plan_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  tags                = var.project_tags
  os_type             = var.service_plan_os_type
  sku_name            = var.service_plan_sku_name

  depends_on = [
    azurerm_resource_group.mybankprojectRG
  ]
}

# Create App Service
resource "azurerm_linux_web_app" "mybankprojectAppSvc" {
  name                = var.app_servic_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.mybankprojectAppSvcPlan.id
  tags                = var.project_tags

  site_config {}

  depends_on = [
    azurerm_resource_group.mybankprojectRG,
    azurerm_linux_web_app.mybankprojectAppSvc
  ]
}

# create mysql_flexible_server
resource "azurerm_mysql_flexible_server" "mybankprojectDBServer" {
  name                   = var.mysql_flexible_server_name
  resource_group_name    = var.resource_group_name
  location               = var.resource_group_location
  administrator_login    = var.db_server_admin_username
  administrator_password = var.db_server_admin__password
  backup_retention_days  = var.db_server_backup_retention_days
  sku_name               = var.db_server_sku_name
  version                = var.db_server_mysql_version

  depends_on = [
    azurerm_resource_group.mybankprojectRG
  ]
}

# create mysql_flexible_database
resource "azurerm_mysql_flexible_database" "mybankprojectdb" {
  name                = var.mysql_flexible_database_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.mybankprojectDBServer.name
  charset             = var.mysql_flexible_database_charset
  collation           = var.mysql_flexible_database_collation

  depends_on = [
    azurerm_resource_group.mybankprojectRG,
    azurerm_mysql_flexible_server.mybankprojectDBServer
  ]
}

# create mysql_flexible_server_firewall_rule
resource "azurerm_mysql_flexible_server_firewall_rule" "mybankprojectMySQLSvrFwlRl" {
  name                = var.mysql_flexible_server_firewall_rule_name
  resource_group_name = var.resource_group_name
  server_name         = var.mysql_flexible_server_name
  start_ip_address    = var.mysql_flexible_server_firewall_rule_start_ip
  end_ip_address      = var.mysql_flexible_server_firewall_rule_end_ip

  depends_on = [
    azurerm_resource_group.mybankprojectRG,
    azurerm_mysql_flexible_server.mybankprojectDBServer
  ]
}










#Resource group related variables

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "resource_group_location" {
  type        = string
  description = "Location of the resource group"
  default     = "North Europe"
}

variable "project_tags" {
  type        = map(string)
  description = "Tags for the project resources"
}

#App Service Plan related variables

variable "service_plan_name" {
  type        = string
  description = "Name of the service plan"
}

variable "service_plan_os_type" {
  type        = string
  description = "The O/S type for the App Services to be hosted in this plan"
}

variable "service_plan_sku_name" {
  type        = string
  description = "Instance type for the App Services to be hosted in this plan"
}

#App Service related variables

variable "app_servic_name" {
  type        = string
  description = "Name of the app service"
}

#MySQL Flexible server related variables

variable "mysql_flexible_server_name" {
  type        = string
  description = "Name of the mysql flexible server"
}

variable "db_server_admin_username" {
  type        = string
  description = "Admin username of the mysql flexible server"
}

variable "db_server_admin__password" {
  type        = string
  description = "Admin password of the mysql flexible server"
}

variable "db_server_backup_retention_days" {
  type        = number
  description = "Backup retention days of the mysql flexible server"
}

variable "db_server_sku_name" {
  type        = string
  description = "Instance type for the mysql flexible server"
}

variable "db_server_mysql_version" {
  type        = string
  description = "MySQL version of the mysql flexible server"
}

#MySQL Flexible database related variables

variable "mysql_flexible_database_name" {
  type        = string
  description = "Name of the mysql flexible database"
}

variable "mysql_flexible_database_charset" {
  type        = string
  description = "Charset of the mysql flexible database"
}

variable "mysql_flexible_database_collation" {
  type        = string
  description = "Collation of the mysql flexible database"
}

#MySQL Flexible server firewall rule related variables

variable "mysql_flexible_server_firewall_rule_name" {
  type        = string
  description = "Name of the mysql flexible server firewall rule"
}

variable "mysql_flexible_server_firewall_rule_start_ip" {
  type        = string
  description = "Start ip of the mysql flexible server firewall rule"
}

variable "mysql_flexible_server_firewall_rule_end_ip" {
  type        = string
  description = "End ip of the mysql flexible server firewall rule"
}
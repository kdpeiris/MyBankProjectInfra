resource_group_name     = "mybankprojectRG"
resource_group_location = "North Europe"
project_tags = {
  Project = "mybankproject"
  Owner   = "Dilshan Peiris"
}
service_plan_name                            = "mybankprojectAppSvcPlan"
service_plan_os_type                         = "Linux"
service_plan_sku_name                        = "B1"
app_servic_name                              = "mybankprojectAppSvc"
mysql_flexible_server_name                   = "mybankprojectdbserver"
db_server_admin_username                     = "kdpeiris"
db_server_admin__password                    = "Dil@0718"
db_server_backup_retention_days              = 7
db_server_sku_name                           = "B_Standard_B1s"
db_server_mysql_version                      = "8.0.21"
mysql_flexible_database_name                 = "mybankprojectdb"
mysql_flexible_database_charset              = "utf8"
mysql_flexible_database_collation            = "utf8_unicode_ci"
mysql_flexible_server_firewall_rule_name     = "mybankprojectMySQLSvrFwlRl"
mysql_flexible_server_firewall_rule_start_ip = "0.0.0.0"
mysql_flexible_server_firewall_rule_end_ip   = "0.0.0.0"
# Use Terraform to provision an App Service and a MySQL Database Server on Azure, and run a PHP web app on them

Provisioned resources via IaC:

- azurerm_resource_group
- azurerm_service_plan
- azurerm_linux_web_app
- azurerm_mysql_flexible_server
- azurerm_mysql_flexible_database
- azurerm_mysql_flexible_server_firewall_rule

Architecture Diagram:

![alt text](https://github.com/kdpeiris/MyBankProjectInfra/blob/main/Azure%20Architecture.png)

After configuring the infrastructure, you need to perform additional configurations to run the PHP web app on Azure App Service.

Task 01: Configure Deployment Settings

- Navigate to the webapp (mybankprojectAppSvc) in the Azure portal
- On the left side, click Deployment Center
- In the Settings tab, select Source as GitHub from the drop down
- Provide the github account details (Organization, repository & Branch)
- Configure runtime stack as PHP, keep other settings as default & Save

Task 02: Disable SSL enforcement on the flexible database server

- Navigate to Azure Database for MySQL flexible server (mybankprojectdbserver)
- On the left side, click Server parameters
- Update the require_secure_transport server parameter to OFF & Save

Task 03: [OPTIONAL] Create a firewall rule on MySQL flexible server to explicitly allow outbound IPs of Azure webapp

- Navigate to the webapp (mybankprojectAppSvc) in the Azure portal
- On the left side, click Overview
- Go to the Properties tab
- Copy the Outbound IP addresses (7) from Networking section
- Navigate to Azure Database for MySQL flexible server (mybankprojectdbserver)
- On the left side, click Networking
- Add them to Firewall rules

Task 04: Connect to the database via the Azure CLI & create customers table.

- Open Azure CLI and paste "mysql -h mybankprojectdbserver.mysql.database.azure.com -u kdpeiris -p mybankprojectdb;"
- Provide MySQL flexible server password
- Run below query to create customer table.

CREATE TABLE mybankprojectdb.customers ( id INT NOT NULL AUTO_INCREMENT, given_name VARCHAR(100) NOT NULL, surname VARCHAR(100) NOT NULL, dob DATE NOT NULL, nic VARCHAR(11) NOT NULL, gender VARCHAR(45) NOT NULL, email VARCHAR(100) NOT NULL, phone_no VARCHAR(11) NOT NULL, account_type VARCHAR(45) NOT NULL, PRIMARY KEY (id));

***Now Azure webapp (mybankprojectappsvc.azurewebsites.net) is ready!

# Challenges:

# Challenge 01:
How to store the Terraform state file(terraform.tfstate) in a shared Azure Storage Account accessible by a group of users.

#Create resource group
az group create --name backendRG --location northeurope

#Create storage account
az storage account create  --resource-group backendRG --name tfstatedilshan --sku Standard_LRS --encryption-services blob

#Create blob container
az storage container create --name backendcontainer --account-name tfstatedilshan

#Get the storage access key and store it as an environment variable
$ACCOUNT_KEY=$(az storage account keys list --resource-group backendRG --account-name tfstatedilshan --query '[0].value' -o tsv) 
$env:ARM_ACCESS_KEY=$ACCOUNT_KEY


# Challenge 02:
When submitting the form, it gives "404 Not Found" error.

Resolution:
Access the web app service logs using below query & disabled SSL enforcement on the flexible database server.

AppServiceConsoleLogs 
| take 50



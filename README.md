This module will help to create a Azure Linux Virtual Machine with System assigned identity and it will aslo assign contributor role to the Virtual Machine. We are also running a shell script inside this Virtual machine using Custom_Data and base64encode function. We have added Network security Group to the Virtual machine , no network security group is attached to the subnet here but we can add in the similar manner. Hope this will help !

Modifications required:

1. Add backend value as per your requirement in versions.tf or create a new file backend.tf--

 /*backend "azurerm" {
    resource_group_name = "**add you resource group name**"
    storage_account_name = "**Add your storage account name**"
    container_name = "**add your container name** "
    key = "**Add you key name eg. terraform.tfstate2**"
    
  }*/

 2. Add tenant id and subscription id  in provider block

  tenant_id = "xxx**Add your tenant id**xxx"
  subscription_id = "xxx**Add your subscription id**xxx"

3. You can change the Bash script too in locals.tf based on your requirement ( I have given one as an example)

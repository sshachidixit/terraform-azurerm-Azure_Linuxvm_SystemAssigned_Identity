This module will help to create a Azure Linux Virtual Machine with System assigned identity and it will aslo assign contributor role to the Virtual Machine. We are also running a shell script inside this Virtual machine using Custom_Data and base64encode function. We have added Network security Group to the Virtual machine , no network security group is attached to the subnet here but we can add in the similar manner. Hope this will help !

Add backend value as per your requirement

 /*backend "azurerm" {
    resource_group_name = "**add you resource group name**"
    storage_account_name = "**Add your storage account name**"
    container_name = "**add your container name** "
    key = "**Add you key name eg. terraform.tfstate2**"
    
  }*/

terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "3.75.0"
    }
    
  }
  /*backend "azurerm" {
    resource_group_name = "**add you resource group name**"
    storage_account_name = "**Add your storage account name**"
    container_name = "**add your container name** "
    key = "** Add you key name eg. terraform.tfstate2 **"
    
  }*/
}



provider "azurerm" {
  # Configuration options
  features {
    
  }
  tenant_id = "xxxxx"
  subscription_id = "xxxxx"
}

provider "azuread" {
    use_msi = true

  
}

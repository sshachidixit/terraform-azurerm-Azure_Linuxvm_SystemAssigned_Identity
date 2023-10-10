terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "3.75.0"
    }
    
  }
  /*backend "azurerm" {
    resource_group_name = "terraform-storage-rg"
    storage_account_name = "tfazurestateshachi"
    container_name = "tfstatefiles2"
    key = "terraform.tfstate2"
    
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

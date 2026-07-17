terraform {
  backend "azurerm" {
    resource_group_name = "rg-terraformdataquery"
    storage_account_name = "saastfstatedata"
    container_name       = "containertfstatedata"
    key                  = "network.tfstate"
  }
}

provider "azurerm" {
  features {}
}

#This is so that eads whatever identity Terraform is currently authenticated as.
data "azurerm_client_config" "current" {}

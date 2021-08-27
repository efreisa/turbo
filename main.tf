# Set providers
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

# Configure the Microsoft Azure Resource Manager Provider
provider "azurerm" {
  features {}

  subscription_id = "2e369df1-a633-493a-813b-4cafbed19261"
}

# Current subscription
data "azurerm_subscription" "current" {}

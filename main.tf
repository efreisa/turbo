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
}

# Current subscription
data "azurerm_subscription" "current" {}

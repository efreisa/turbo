# Set providers
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

# Configure the Microsoft Azure Active Directory Provider
provider "azuread" {
}

# Configure the Microsoft Azure Resource Manager Provider
provider "azurerm" {
  features {}
}

# Current subscription
data "azurerm_subscription" "current" {}

resource "random_password" "turbo_password" {
  length = 16
  special = true
}

resource "azuread_user" "turbo_user" {
  user_principal_name  = var.turbo_upn
  display_name  = var.turbo_displayname
  password      = random_password.turbo_password.result
}

resource "azurerm_role_assignment" "turbo_role" {
  scope                = data.azurerm_subscription.current.id
  role_definition_name = "Contributor"
  principal_id         = azuread_user.turbo_user.id
}

output "password" {
  description = "The password is:" 
  value = random_password.turbo_password.result
}
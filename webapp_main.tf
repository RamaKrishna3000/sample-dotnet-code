terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.2.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {

  }
}

resource "azurerm_resource_group" "rg-dev" {
  name     = "rg-mytta-dev-eus-01"
  location = "EastUS"
}

resource "azurerm_app_service_plan" "appservice-dev" {
  name                = "appserviceplan-mytta-dev-eus-01"
  location            = azurerm_resource_group.rg-dev.location
  resource_group_name = azurerm_resource_group.rg-dev.name

  sku {
    tier = "Free"
    size = "F1"
  }
}
resource "azurerm_app_service" "webapp-dev" {
  name                = "webapp-mytta-dev-eus-001"
  location            = azurerm_resource_group.rg-dev.location
  resource_group_name = azurerm_resource_group.rg-dev.name
  app_service_plan_id = azurerm_app_service_plan.appservice-dev.id

}


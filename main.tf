terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.100.0"
    }
  }
}

provider "azurerm" {
  features {}
}

variable "prefix" {
  default = "samacr"
}

variable "location" {
  default = "centralindia"
}

resource "azurerm_resource_group" "acr_rg" {
  name     = "${var.prefix}-rg"
  location = var.location
  tags = {
    Environment = "Production"
    ManagedBy   = "Terraform"
  }
}

resource "azurerm_container_registry" "acr" {
  name                = "${var.prefix}registry"
  resource_group_name = azurerm_resource_group.acr_rg.name
  location            = azurerm_resource_group.acr_rg.location
  sku                 = "Premium"
  admin_enabled       = false

  georeplications {
    location                = "southindia"
    zone_redundancy_enabled = true
    tags                    = { Region = "Replica" }
  }

  retention_policy {
    days    = 30
    enabled = true
  }

  trust_policy {
    enabled = true
  }

  data_endpoint_enabled = true
  public_network_access_enabled = true
}

output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}

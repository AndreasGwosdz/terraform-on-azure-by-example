terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.95.0"
    }
  }
  required_version = ">= 1.7.5"
}

provider "azurerm" {
  features {
  }
}

variable "location_short" {
  type    = string
  default = "gwc"
}

variable "location_map" {
  type = map(string)
  default = {
    "gwc" = "germanywestcentral"
    "weu" = "westeurope"
  }
}

resource "azurerm_resource_group" "this" {
  name     = "rg-terraform-lookup-${var.location_short}"
  location = var.location_map[var.location_short]
}
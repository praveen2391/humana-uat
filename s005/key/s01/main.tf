terraform {
  backend "azurerm" {
    key = "key/s01.tfstate"
  }

  required_version = "1.0.11"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.99.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "resource_group" {
  source = "git@github.com:praveen2391/humana-tf-modules.git//resource-group"
  location = var.location
  project = var.project
  lob = var.lob
  zone = var.zone
}

module "keyvault" {
  source = "git@github.com:praveen2391/humana-tf-modules.git//keyvault"
  tenant_id = var.tenant_id
  resource_group_name = module.resource_group.name
  location = var.location
  project = var.project
  lob = var.lob
  zone = var.zone   
}
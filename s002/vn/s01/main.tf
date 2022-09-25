terraform {
  backend "azurerm" {
    key = "vn/s01.tfstate"
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

module "name" {
  
}
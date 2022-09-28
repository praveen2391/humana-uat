terraform {
  backend "azurerm" {
    key = "lb/s01.tfstate"
  }

  required_version = "1.0.11"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.99.0"
    }
  }
}

provider "azurerm" {
  features {}
}



resource "azurerm_public_ip_prefix" "public_ip" {
  name                = "${terraform.workspace}-${var.project}-${var.location}-pip-prefix"
  location            = data.terraform_remote_state.vn.outputs.location
  resource_group_name = data.terraform_remote_state.vn.outputs.resource_group_name

  prefix_length = 31

  tags = {
    environment       = terraform.workspace
  }
}
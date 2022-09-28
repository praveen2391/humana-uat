data "terraform_remote_state" "vn" {
  backend = "azurerm"

  config = {
    storage_account_name = var.storage_account_name
    container_name = var.container_name
    access_key = var.ARM_ACCESS_KEY
    key = "vn/s01.tfstateenv:s002"
   }
}

data "terraform_remote_state" "lb" {
  backend = "azurerm"

  config = {
    storage_account_name = var.storage_account_name
    container_name = var.container_name
    access_key = var.ARM_ACCESS_KEY
    key = "lb/s01.tfstateenv:s002"
   }
}

data "terraform_remote_state" "key" {
  backend = "azurerm"

  config = {
    storage_account_name = var.storage_account_name
    container_name = var.container_name
    access_key = var.ARM_ACCESS_KEY
    key = "key/s01.tfstateenv:s005"
   }
}
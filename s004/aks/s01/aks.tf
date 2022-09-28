# Data source from shared keyvault to read sp app_id and sp secret , linux profile and windows profile password

data "azurerm_key_vault" "keyvault" {
    name = data.terraform_remote_state.key.outputs.keyvault_name
    resource_group_name = data.terraform_remote_state.key.outputs.resource_group_name
}

data "azurerm_key_vault_secret" "k8s-aks-sp-app-id" {
  name = "k8s-aks-sp-app-id"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

data "azurerm_key_vault_secret" "k8s-aks-sp-secret" {
  name = "k8s-aks-sp-secret"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

data "azurerm_key_vault_secret" "k8s-aks-ssh-public-key" {
  name = "k8s-aks-ssh-public-key"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

data "azurerm_key_vault_secret" "k8s-aks-win-password" {
  name = "k8s-aks-win-password"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

# kubernetes cluster resource 

resource "azurerm_kubernetes_cluster" "k8s" {
    name                = "${terraform.workspace}-platform-${var.project}-${var.location}-01"
    location            = module.resource_group.location
    resource_group_name = module.resource_group.name
    dns_prefix          = "${terraform.workspace}-platform-${var.project}-${var.location}-01-aks"
    kubernetes_version  = "1.22.11"
    sku_tier            = "Free"
    linux_profile {
      admin_username = "humana-admin"
      ssh_key {
        key_data = data.azurerm_key_vault_secret.k8s-aks-ssh-public-key.value
      }
    }

    windows_profile {
      admin_username = "humana-admin"
      admin_password = data.azurerm_key_vault_secret.k8s-aks-win-password.value
    }

    
  
}
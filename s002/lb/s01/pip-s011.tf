resource "azurerm_public_ip" "s004_pip" {
  name                = "s004-pip"
  resource_group_name = data.terraform_remote_state.vn.outputs.resource_group_name
  location            = data.terraform_remote_state.vn.outputs.location
  allocation_method   = "Static"
  sku                 = "Standard"
  domain_name_label   = "s004-dss-enroll" 
  public_ip_prefix_id = azurerm_public_ip_prefix.public_ip.id

  tags = {
    environment       = terraform.workspace
  }
}

output "s004_pip_id" {
  value = azurerm_public_ip.s004_pip.id
}

output "s004_pip" {
  value = azurerm_public_ip.s004_pip.*.ip_address[0]
}

output "s004_pip_fqdn" {
  value = azurerm_public_ip.s004_pip.fqdn
}
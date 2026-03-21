# --- Use existing Resource Group (READ-ONLY to Terraform) ---
data "azurerm_resource_group" "mb_rg" {
  name = var.resource_group_name
}

# --- Create new ACR inside that existing RG ---
resource "azurerm_container_registry" "mb_acr" {
  name                = var.acr_name
  resource_group_name = data.azurerm_resource_group.mb_rg.name
  location            = data.azurerm_resource_group.mb_rg.location
  sku                 = var.acr_sku
  admin_enabled       = true
}
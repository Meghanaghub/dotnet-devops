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

# -------------------------
# Virtual Network
# -------------------------
resource "azurerm_virtual_network" "mb_vnet" {
  name                = var.vnet_name
  location            = data.azurerm_resource_group.mb_rg.location
  resource_group_name = data.azurerm_resource_group.mb_rg.name
  address_space       = var.vnet_address_space
}

# -------------------------
# AKS Subnet
# -------------------------
resource "azurerm_subnet" "aks_subnet" {
  name                 = var.aks_subnet_name
  resource_group_name  = data.azurerm_resource_group.mb_rg.name
  virtual_network_name = azurerm_virtual_network.mb_vnet.name
  address_prefixes     = [var.aks_subnet_prefix]
}

# -------------------------
# App Subnet (Future Use)
# -------------------------
resource "azurerm_subnet" "app_subnet" {
  name                 = var.app_subnet_name
  resource_group_name  = data.azurerm_resource_group.mb_rg.name
  virtual_network_name = azurerm_virtual_network.mb_vnet.name
  address_prefixes     = [var.app_subnet_prefix]
}
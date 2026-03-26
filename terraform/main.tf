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

resource "azurerm_kubernetes_cluster" "mb_aks" {
  name                = var.aks_name
  location            = data.azurerm_resource_group.mb_rg.location
  resource_group_name = data.azurerm_resource_group.mb_rg.name
  dns_prefix          = var.aks_dns_prefix

  default_node_pool {
    name           = "system"
    node_count     = var.aks_node_count
    vm_size        = var.aks_vm_size
    vnet_subnet_id = azurerm_subnet.aks_subnet.id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"
    service_cidr   = "172.16.0.0/16"
    dns_service_ip = "172.16.0.10"
  }

  role_based_access_control_enabled = true

  depends_on = [
    azurerm_subnet.aks_subnet
  ]
}

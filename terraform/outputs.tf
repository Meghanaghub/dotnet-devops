output "acr_login_server" {
  value = azurerm_container_registry.mb_acr.login_server
}

output "aks_subnet_id" {
  value = azurerm_subnet.aks_subnet.id
}

output "app_subnet_id" {
  value = azurerm_subnet.app_subnet.id
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.mb_aks.kube_config_raw
  sensitive = true
}
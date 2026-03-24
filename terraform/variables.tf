variable "resource_group_name" {
  type = string
}

variable "resource_group_location" {
  type = string
}

variable "acr_name" {
  type = string
}

variable "acr_sku" {
  type    = string
  default = "Basic"
}

variable "vnet_name" {
  type = string
}

variable "vnet_address_space" {
  type = list(string)
}

variable "aks_subnet_name" {
  type = string
}

variable "aks_subnet_prefix" {
  type = string
}

variable "app_subnet_name" {
  type = string
}

variable "app_subnet_prefix" {
  type = string
}
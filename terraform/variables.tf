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
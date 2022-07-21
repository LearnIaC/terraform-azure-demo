variable "azure_subscription_id" {
  type     = string
  nullable = false
}

variable "azure_tenant_id" {
  type     = string
  nullable = false
}

variable "azure_sp_client_id" {
  type     = string
  nullable = false
}

variable "azure_sp_client_secret" {
  type      = string
  nullable  = false
  sensitive = true
}

variable "resource_group_name" {
  type     = string
  nullable = false
}

variable "location" {
  type     = string
  nullable = false
}
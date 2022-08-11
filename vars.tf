variable "subscription_id" {
  type     = string
  nullable = false
}

variable "tenant_id" {
  type     = string
  nullable = false
}

variable "client_id" {
  type     = string
  nullable = false
}

variable "client_secret" {
  type      = string
  nullable  = false
  sensitive = true
}

variable "resource_group_name" {
  type      = string
  nullable  = false
}

variable "storage_account_name" {
  type      = string
  nullable  = false
}

variable "container_name" {
  type      = string
  nullable  = false
}

variable "key" {
  type      = string
  nullable  = false
}

variable "azuredevops_org_url" {
  type      = string
  nullable  = false
}

variable "azuredevops_pat" {
  type      = string
  nullable  = false
  sensitive = true
}

variable "app_resource_group_name" {
  type     = string
  nullable = false
}

variable "location" {
  type     = string
  nullable = false
}
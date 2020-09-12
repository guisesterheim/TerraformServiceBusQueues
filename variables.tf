# General purpose parameters
variable "client_secret" {
  type        = string
  description = "The password for this user"
}

variable "subscription_id" {
  type        = string
  description = "The subscription to which the configurations must be applied"
}

variable "client_id" {
  type        = string
  description = "The user name"
}

variable "tenant_id" {
  type        = string
  description = "The identification for Microsoft AD"
}

variable "environment" {
  type        = string
  description = "Target Environment"
  default     = "dev"
}

variable "location" {
  description = "Target Location"
  default     = "East US 2"
}

variable "resource_group_name" {
  description = "Resource group name"
  default     = "app1"
}

# Variables for tags
variable billing_code_tag {
  type        = string
  default     = "app1"
  description = "The billing code to add as tag for app1 resources"
}

variable services_bus_namespace_name {
  type        = string
  description = "Name for the queue namespace"
}

variable messages_queue_name {
  type        = string
  description = "Messages queue name"
}

variable messages_error_queue_name {
  type        = string
  description = "Error queue name"
}
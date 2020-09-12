# Declares the main provider
provider "azurerm" {
  version = "~> 2.27.0"

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id

  features {}
}

terraform {
  backend "azurerm" {}
}

# Common group
module "common" {
  resource_group_name = var.resource_group_name
  location            = var.location
  environment         = var.environment
  billing_code_tag    = var.billing_code_tag

  source = "./modules/common"
}

# Queue group
module "queue" {
  location    = var.location
  environment = var.environment

  # Output module common
  resource_group_name         = module.common.resource_group_name
  common_tags                 = module.common.common_tags
  services_bus_namespace_name = var.services_bus_namespace_name
  messages_queue_name         = var.messages_queue_name
  messages_error_queue_name   = var.messages_error_queue_name

  source     = "./modules/queue"
  depends_on = [module.common]
}
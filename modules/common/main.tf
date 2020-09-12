# Configuration for terarform to store tfstate files remotely

# Creates the resource group
resource "azurerm_resource_group" "rg" {
  name     = local.resource_group_name
  location = var.location

  tags = local.common_tags
}
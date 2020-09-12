# Creates the queue
resource "azurerm_servicebus_namespace" "busNamespace" {
  name                = var.services_bus_namespace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Basic"

  tags = var.common_tags
}

# Queue for regular messages
resource "azurerm_servicebus_queue" "app1MessagesQueue" {
  name                = var.messages_queue_name
  resource_group_name = var.resource_group_name
  namespace_name      = azurerm_servicebus_namespace.busNamespace.name

  lock_duration         = "PT30S"
  max_size_in_megabytes = 1024
  enable_partitioning   = true
}

# Queue for messages that had errors
resource "azurerm_servicebus_queue" "app1MessagesErrorQueue" {
  name                = var.messages_error_queue_name
  resource_group_name = var.resource_group_name
  namespace_name      = azurerm_servicebus_namespace.busNamespace.name

  max_size_in_megabytes                = 1024
  enable_partitioning                  = true
  default_message_ttl                  = lookup(var.message_expiration_time, var.environment)
  dead_lettering_on_message_expiration = true
  forward_dead_lettered_messages_to    = azurerm_servicebus_queue.app1MessagesQueue.name
}

# Credentials for App1 message generator
resource "azurerm_servicebus_queue_authorization_rule" "app1MessagesWriter" {
  name                = "app1MessagesWriter"
  namespace_name      = azurerm_servicebus_namespace.busNamespace.name
  queue_name          = azurerm_servicebus_queue.app1MessagesQueue.name
  resource_group_name = var.resource_group_name

  listen = false
  send   = true
  manage = false
}

# Credentials for Azure Functions consumer
resource "azurerm_servicebus_queue_authorization_rule" "app1MessagesReader" {
  name                = "app1MessagesReader"
  namespace_name      = azurerm_servicebus_namespace.busNamespace.name
  queue_name          = azurerm_servicebus_queue.app1MessagesQueue.name
  resource_group_name = var.resource_group_name

  listen = true
  send   = false
  manage = false
}

# Credentials for App1 message generator
resource "azurerm_servicebus_queue_authorization_rule" "app1ErrorMessagesWriter" {
  name                = "app1ErrorMessagesWriter"
  namespace_name      = azurerm_servicebus_namespace.busNamespace.name
  queue_name          = azurerm_servicebus_queue.app1MessagesErrorQueue.name
  resource_group_name = var.resource_group_name

  listen = false
  send   = true
  manage = false
}
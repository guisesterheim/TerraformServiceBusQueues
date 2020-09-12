output messages_queue_reader_connection_string {
  value = azurerm_servicebus_queue_authorization_rule.app1MessagesReader.primary_connection_string
}

output messages_queue_writer_connection_string {
  value = azurerm_servicebus_queue_authorization_rule.app1MessagesWriter.primary_connection_string
}

output error_messages_queue_writer_connection_string {
  value = azurerm_servicebus_queue_authorization_rule.AZFunctionsErrorMessagesWriter.primary_connection_string
}

output error_message_queue_name {
  value = azurerm_servicebus_queue.app1MessagesErrorQueue.name
}

output messages_queue_name {
  value = azurerm_servicebus_queue.app1MessagesQueue.name
}
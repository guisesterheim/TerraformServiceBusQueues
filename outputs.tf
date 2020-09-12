output resource_group_name {
  value = module.common.resource_group_name
}

output messages_queue_name {
  value = module.queue.messages_queue_name
}

output error_message_queue_name {
  value = module.queue.error_message_queue_name
}

output messages_queue_reader_connection_string {
  value = module.queue.messages_queue_reader_connection_string
}

output messages_queue_writer_connection_string {
  value = module.queue.messages_queue_writer_connection_string
}

output error_messages_queue_writer_connection_string {
  value = module.queue.error_messages_queue_writer_connection_string
}
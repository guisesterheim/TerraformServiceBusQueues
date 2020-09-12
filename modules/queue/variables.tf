variable environment {}
variable location {}
variable resource_group_name {}

variable common_tags {}

variable services_bus_namespace_name {}
variable messages_queue_name {}
variable messages_error_queue_name {}

variable message_expiration_time {
  type        = map(string)
  description = "Message auto expiration time"
  default = {
    dev = "PT30S"
    qa  = "PT30S"
    hlg = "PT30S"
    prd = "PT3600S"
  }
}
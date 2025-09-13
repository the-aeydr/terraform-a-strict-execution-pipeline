variable "expiration_days" {
  type        = string
  description = "Number of days until objects are expunged."
  default     = 30
}

variable "bucket" {
  type        = string
  description = "The name of the bucket."
}

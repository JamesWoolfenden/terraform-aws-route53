variable "name" {
  type = string
}

variable "comment" {
  type = string
}

variable "vpc_tag" {
  type = string
}


variable "kms_key_id" {
  type        = string
  description = "Encryption key"
}

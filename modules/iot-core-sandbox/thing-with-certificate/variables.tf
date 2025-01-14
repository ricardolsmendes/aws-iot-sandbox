variable "environment" {
  description = "The deployment environment."
  type        = string
}

variable "name" {
  description = "Name of the thing."
  type        = string
}

variable "type" {
  description = "Type of the thing."
  type = object({
    name = string
  })
}

variable "group" {
  description = "The group the thing is a member of."
  type = object({
    name = string
  })
}

variable "certificates_bucket" {
  description = "The bucket used to stored the security certificates."
  type = object({
    id = string
  })
}

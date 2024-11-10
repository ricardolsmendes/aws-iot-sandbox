variable "environment" {
  description = "The deployment environment."
  type        = string
  default     = "dev"
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

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

variable "certificate" {
  description = "Certificate to be attached to the thing."
  type = object({
    arn = string
  })
}

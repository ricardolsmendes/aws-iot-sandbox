variable "aws_access_key" {
  description = "The AWS access key."
  type        = string
  default     = ""
  sensitive   = true
}

variable "aws_secret_key" {
  description = "The AWS secret key."
  type        = string
  default     = ""
  sensitive   = true
}

variable "aws_region" {
  description = "The AWS region."
  type        = string
  default     = ""
}

variable "environment" {
  description = "The deployment environment."
  type        = string
  default     = "qa"
}

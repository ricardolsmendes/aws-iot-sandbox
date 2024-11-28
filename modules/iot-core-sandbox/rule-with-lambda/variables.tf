variable "environment" {
  description = "The deployment environment."
  type        = string
}

variable "rule_name" {
  description = "Name of the rule."
  type        = string
}

variable "rule_description" {
  description = "Description of the rule."
  type        = string
}

variable "topic_name" {
  description = "Name of the IoT Topic."
  type        = string
}

variable "lambda_function_arn" {
  description = "The target Lambda Function's ARN."
  type        = string
}

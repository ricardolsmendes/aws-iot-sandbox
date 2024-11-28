resource "aws_iot_topic_rule" "rule" {
  name        = replace("${var.rule_name}_${var.environment}", "-", "_")
  description = var.rule_description
  enabled     = true
  sql         = "SELECT * FROM '${var.topic_name}'"
  sql_version = "2016-03-23"

  lambda {
    function_arn = var.lambda_function_arn
  }
}

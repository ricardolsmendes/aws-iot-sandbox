resource "aws_iot_thing_type" "thing_types" {
  for_each = local.thing_types

  name = "${each.value.name}-${var.environment}"
}

resource "aws_iot_thing_group" "thing_groups" {
  for_each = local.thing_groups

  name = "${each.value.name}-${var.environment}"
}

resource "aws_s3_bucket" "certificates" {
  bucket = "iot-sandbox-certificates-${var.environment}"
}

module "things_with_certificates" {
  source   = "./thing-with-certificate"
  for_each = local.things

  environment         = var.environment
  name                = each.value.name
  type                = each.value.type
  group               = each.value.group
  certificates_bucket = aws_s3_bucket.certificates
}

module "lambda_functions" {
  source = "./lambda-functions"

  environment = var.environment
}

resource "aws_iot_topic_rule" "print_event_rules" {
  for_each = local.things

  name        = replace("PrintEventRule_${local.things[each.key].name}_${var.environment}", "-", "_")
  description = "Print events published to the '${module.things_with_certificates[each.key].topic_name}' topic."
  enabled     = true
  sql         = "SELECT * FROM '${module.things_with_certificates[each.key].topic_name}'"
  sql_version = "2016-03-23"

  lambda {
    function_arn = module.lambda_functions.event_printer_arn
  }
}

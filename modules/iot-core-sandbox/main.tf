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

module "lambdas" {
  source = "./lambdas"

  environment = var.environment
}

module "rules_with_lambda" {
  source   = "./rule-with-lambda"
  for_each = local.things

  environment         = var.environment
  rule_name           = "PrintEventRule_${local.things[each.key].name}"
  rule_description    = "Print events published to the '${module.things_with_certificates[each.key].topic_name}' topic."
  topic_name          = module.things_with_certificates[each.key].topic_name
  lambda_function_arn = module.lambdas.event_printer_lambda_arn
}

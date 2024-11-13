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

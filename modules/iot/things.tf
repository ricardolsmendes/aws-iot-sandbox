locals {
  things_map = {
    generic_temperature_sensor = {
      name  = "generic-temperature-sensor"
      type  = aws_iot_thing_type.thing_types["temperature_sensor"]
      group = aws_iot_thing_group.thing_groups["sensors"]
    }
  }
}

module "things" {
  source   = "./thing"
  for_each = local.things_map

  name        = "${each.value.name}-${var.environment}"
  type        = each.value.type
  group       = each.value.group
  certificate = aws_iot_certificate.cert
}

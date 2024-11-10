locals {
  things_map = {
    simulated_thermometer = {
      name  = "simulated-thermometer"
      type  = aws_iot_thing_type.thing_types["temperature_sensor"]
      group = aws_iot_thing_group.thing_groups["sensors"]
    }
  }
}

module "things_with_certificates" {
  source   = "./thing-with-certificate"
  for_each = local.things_map

  environment = var.environment
  name        = "${each.value.name}-${var.environment}"
  type        = each.value.type
  group       = each.value.group
}

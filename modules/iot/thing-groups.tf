locals {
  thing_groups_map = {
    industrial_devices = {
      name = "industrial-devices"
    },
    logistics_devices = {
      name = "logistics-devices"
    },
    medical_devices = {
      name = "medical-devices"
    },
    personal_transportation_devices = {
      name = "personal-transportation-devices"
    },
    point_of_sale_devices = {
      name = "point-of-sale-devices"
    },
    security_devices = {
      name = "security-devices"
    },
    sensors = {
      name = "sensors"
    },
    smart_home_devices = {
      name = "smart-home-devices"
    },
    smart_wearables = {
      name = "smart-wearables"
    }
  }
}

resource "aws_iot_thing_group" "thing_groups" {
  for_each = local.thing_groups_map

  name = "${each.value.name}-${var.environment}"
}

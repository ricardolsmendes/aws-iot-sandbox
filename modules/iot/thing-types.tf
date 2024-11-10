locals {
  thing_types_map = {
    air_quality_sensor = {
      name = "air-quality-sensor"
    },
    barcode_scanner = {
      name = "barcode-scanner"
    },
    employee_posture_monitor = {
      name = "employee-posture-monitor"
    },
    humidity_sensor = {
      name = "humidity-sensor"
    },
    noise_level_monitor = {
      name = "noise-level-monitor"
    },
    noise_level_sensor = {
      name = "noise-level-sensor"
    },
    oil_analysis_sensor = {
      name = "oil-analysis-sensor"
    },
    pressure_sensor = {
      name = "pressure-sensor"
    },
    proximity_sensor = {
      name = "proximity-sensor"
    },
    temperature_sensor = {
      name = "temperature-sensor"
    },
    ibration_sensor = {
      name = "vibration-sensor"
    },
    water_quality_sensor = {
      name = "water-quality-sensor"
    }
  }
}

resource "aws_iot_thing_type" "thing_types" {
  for_each = local.thing_types_map

  name = "${each.value.name}-${var.environment}"
}

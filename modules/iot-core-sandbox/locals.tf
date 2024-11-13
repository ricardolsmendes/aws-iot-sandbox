locals {
  thing_types = {
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
    vibration_sensor = {
      name = "vibration-sensor"
    },
    water_quality_sensor = {
      name = "water-quality-sensor"
    }
  }

  thing_groups = {
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

  things = {
    simulated_thermometer = {
      name  = "simulated-thermometer"
      type  = aws_iot_thing_type.thing_types["temperature_sensor"]
      group = aws_iot_thing_group.thing_groups["sensors"]
    }
  }
}

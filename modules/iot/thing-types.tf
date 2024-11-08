resource "aws_iot_thing_type" "air_quality_sensor" {
  name = "air-quality-sensor-${var.environment}"
}

resource "aws_iot_thing_type" "barcode_scanner" {
  name = "barcode-scanner-${var.environment}"
}

resource "aws_iot_thing_type" "employee_posture_monitor" {
  name = "employee-posture-monitor-${var.environment}"
}

resource "aws_iot_thing_type" "humidity_sensor" {
  name = "humidity-sensor-${var.environment}"
}

resource "aws_iot_thing_type" "noise_level_monitor" {
  name = "noise-level-monitor-${var.environment}"
}
resource "aws_iot_thing_type" "noise_level_sensor" {
  name = "noise-level-sensor-${var.environment}"
}

resource "aws_iot_thing_type" "oil_analysis_sensor" {
  name = "oil-analysis-sensor-${var.environment}"
}

resource "aws_iot_thing_type" "pressure_sensor" {
  name = "pressure-sensor-${var.environment}"
}

resource "aws_iot_thing_type" "proximity_sensor" {
  name = "proximity-sensor-${var.environment}"
}

resource "aws_iot_thing_type" "temperature_sensor" {
  name = "temperature-sensor-${var.environment}"
}

resource "aws_iot_thing_type" "vibration_sensor" {
  name = "vibration-sensor-${var.environment}"
}

resource "aws_iot_thing_type" "water_quality_sensor" {
  name = "water-quality-sensor-${var.environment}"
}

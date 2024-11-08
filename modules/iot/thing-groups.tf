resource "aws_iot_thing_group" "industrial_devices" {
  name = "industrial-devices"
}

resource "aws_iot_thing_group" "logistics_devices" {
  name = "logistics-devices"
}

resource "aws_iot_thing_group" "medical_devices" {
  name = "medical-devices"
}

resource "aws_iot_thing_group" "personal_transportation_devices" {
  name = "personal-transportation-devices"
}

resource "aws_iot_thing_group" "point_of_sale_devices" {
  name = "point-of-sale-devices"
}

resource "aws_iot_thing_group" "security_devices" {
  name = "security-devices"
}

resource "aws_iot_thing_group" "sensors" {
  name = "sensors"
}

resource "aws_iot_thing_group" "smart_home_devices" {
  name = "smart-home-devices"
}

resource "aws_iot_thing_group" "smart_wearables" {
  name = "smart-wearables"
}

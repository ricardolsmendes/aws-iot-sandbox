resource "aws_iot_thing_group" "industrial_devices" {
  name = "Industrial devices"
}

resource "aws_iot_thing_group" "logistics_devices" {
  name = "Llogistics devices"
}

resource "aws_iot_thing_group" "medical_devices" {
  name = "Medical devices"
}

resource "aws_iot_thing_group" "personal_transportation_devices" {
  name = "Personal transportation devices"
}

resource "aws_iot_thing_group" "point_of_sale_devices" {
  name = "Point of sale devices"
}

resource "aws_iot_thing_group" "security_devices" {
  name = "Security devices"
}

resource "aws_iot_thing_group" "sensors" {
  name = "Sensors"
}

resource "aws_iot_thing_group" "smart_home_devices" {
  name = "Smart home devices"
}

resource "aws_iot_thing_group" "smart_wearables" {
  name = "Smart wearables"
}

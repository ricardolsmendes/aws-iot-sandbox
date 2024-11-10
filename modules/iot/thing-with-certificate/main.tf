resource "aws_iot_thing" "thing" {
  name            = var.name
  thing_type_name = var.type.name
}

resource "aws_iot_thing_group_membership" "thing_group_membership" {
  thing_name       = aws_iot_thing.thing.name
  thing_group_name = var.group.name
}

resource "aws_iot_thing_principal_attachment" "thing_certificate_attachment" {
  thing     = aws_iot_thing.thing.name
  principal = aws_iot_certificate.cert.arn
}

resource "aws_iot_policy" "publish_telemetry" {
  name   = "${aws_iot_thing.thing.name}-PublishTelemetryPolicy"
  policy = data.aws_iam_policy_document.publish_telemetry.json
}

resource "aws_iot_policy_attachment" "publish_telemetry" {
  policy = aws_iot_policy.publish_telemetry.name
  target = aws_iot_certificate.cert.arn
}

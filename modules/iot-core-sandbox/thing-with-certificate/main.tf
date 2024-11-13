resource "aws_iot_thing" "this" {
  name            = "${var.name}-${var.environment}"
  thing_type_name = var.type.name
}

resource "aws_iot_thing_group_membership" "this" {
  thing_name       = aws_iot_thing.this.name
  thing_group_name = var.group.name
}

# ===================================================================================== #
#                                 CERTIFICATE MANAGEMENT                                #
# ===================================================================================== #
resource "aws_iot_certificate" "this" {
  active = true
}

resource "aws_iot_thing_principal_attachment" "thing_certificate" {
  thing     = aws_iot_thing.this.name
  principal = aws_iot_certificate.this.arn
}

# Stores the certificate in S3.
resource "aws_s3_object" "certificate_pem" {
  bucket  = var.certificates_bucket.id
  key     = "${aws_iot_thing.this.name}.cert.pem"
  content = aws_iot_certificate.this.certificate_pem
}

resource "aws_s3_object" "certificate_private_key" {
  bucket  = var.certificates_bucket.id
  key     = "${aws_iot_thing.this.name}.private.key"
  content = aws_iot_certificate.this.private_key
}

# Stores the certificate in Secrets Manager.
# resource "aws_secretsmanager_secret" "this" {
#   name = "iot-core/things/${aws_iot_thing.this.name}"
# }

# resource "aws_secretsmanager_secret_version" "this" {
#   secret_id = aws_secretsmanager_secret.this.id
#   secret_string = jsonencode({
#     "cert.pem"    = aws_iot_certificate.this.certificate_pem
#     "private.key" = aws_iot_certificate.this.private_key
#   })
# }

# ===================================================================================== #
#                                   POLICY MANAGEMENT                                   #
# ===================================================================================== #
resource "aws_iot_policy" "publish" {
  name   = "${aws_iot_thing.this.name}-PublishPolicy"
  policy = data.aws_iam_policy_document.publish.json
}

resource "aws_iot_policy_attachment" "publish" {
  policy = aws_iot_policy.publish.name
  target = aws_iot_certificate.this.arn
}

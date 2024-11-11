resource "aws_s3_bucket" "certificates" {
  bucket = "iot-sandbox-certificates-${var.environment}"
}

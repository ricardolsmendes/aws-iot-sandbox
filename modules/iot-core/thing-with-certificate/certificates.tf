resource "aws_iot_certificate" "cert" {
  active = true
}

resource "aws_s3_object" "certificate_pem" {
  bucket  = var.certificates_bucket.id
  key     = "${aws_iot_thing.thing.name}.cert.pem"
  content = aws_iot_certificate.cert.certificate_pem
}

resource "aws_s3_object" "private_key" {
  bucket  = var.certificates_bucket.id
  key     = "${aws_iot_thing.thing.name}.private.key"
  content = aws_iot_certificate.cert.private_key
}

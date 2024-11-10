resource "aws_iot_certificate" "cert" {
  active = true
}

resource "aws_s3_object" "certificate_pem" {
  bucket  = aws_s3_bucket.certificates.id
  key     = "${aws_iot_certificate.cert.id}.cert.pem"
  content = aws_iot_certificate.cert.certificate_pem
}

resource "aws_s3_object" "private_key" {
  bucket  = aws_s3_bucket.certificates.id
  key     = "${aws_iot_certificate.cert.id}.private.key"
  content = aws_iot_certificate.cert.private_key
}

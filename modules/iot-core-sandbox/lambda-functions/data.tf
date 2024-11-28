data "archive_file" "event_printer_lambda" {
  type        = "zip"
  source_file = "${path.module}/event_printer.py"
  output_path = "event-printer-function.zip"
}

data "aws_iam_policy_document" "lambda_service_trust" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

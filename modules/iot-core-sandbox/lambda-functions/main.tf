resource "aws_iam_role" "lambda_service_custom" {
  name               = "IoTSandboxLambdaServiceRole-${var.environment}"
  description        = "Role assumed by Lambda functions in the IoT Core Sandbox."
  assume_role_policy = data.aws_iam_policy_document.lambda_service_trust.json
}

resource "aws_iam_role_policy_attachment" "lambda_service_managed" {
  role       = aws_iam_role.lambda_service_custom.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_lambda_function" "event_printer" {
  filename         = data.archive_file.event_printer_lambda.output_path
  function_name    = "iot-event-printer-${var.environment}"
  handler          = "event_printer.handle"
  role             = aws_iam_role.lambda_service_custom.arn
  runtime          = "python3.9"
  source_code_hash = data.archive_file.event_printer_lambda.output_base64sha256
}

# ===================================================================================== #
#                               LAMBDA FUNCTION DEFINITION                              #
# ===================================================================================== #
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

resource "aws_iam_role" "lambda_service_custom" {
  name               = "IoTSandboxLambdaServiceRole-${var.environment}"
  description        = "Role assumed by Lambda functions in the IoT Core Sandbox."
  assume_role_policy = data.aws_iam_policy_document.lambda_service_trust.json
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "${path.module}/event_handler_lambda.py"
  output_path = "event-handler-function.zip"
}

resource "aws_lambda_function" "event_handler" {
  filename         = data.archive_file.lambda.output_path
  function_name    = "iot-event-handler"
  handler          = "event_handler_lambda.lambda_handler"
  role             = aws_iam_role.lambda_service_custom.arn
  runtime          = "python3.9"
  source_code_hash = data.archive_file.lambda.output_base64sha256
}

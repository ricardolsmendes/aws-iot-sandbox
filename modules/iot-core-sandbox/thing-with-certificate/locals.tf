locals {
  topic_name = "$aws/things/${aws_iot_thing.this.name}/data"
}

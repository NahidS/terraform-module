################################################################################
# S3 buckets
################################################################################


################################################################################
# DynamoDB Resources
################################################################################


################################################################################
# Parameter Store Resources
################################################################################

resource "aws_ssm_parameter" "parameter-s3-bucket-test" {
  description = "AWS S3 bucket to store data"
  name = "/config/terraform-module/aws/s3/bucket-name"
  type = "String"
  value = "${var.bucket_name}"
  tags {
    Namespace = "${var.namespace}"
    Stage = "${var.stage}"
  }
}

resource "aws_ssm_parameter" "alfredpad-log-level" {
  description = "Log level for alfredpad"
  name = "/config/alfredpad-api/logging/level/com/adirit"
  type = "String"
  value = "${var.alfredpad-log-level}"
  tags {
    Namespace = "${var.namespace}"
    Stage = "${var.stage}"
  }
}



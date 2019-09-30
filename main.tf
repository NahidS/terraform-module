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
  name = "/config/alfredpad-api_dev/alfredpad/aws/s3/bucket-name"
  type = "String"
  value = "${var.bucket_name}"
  tags {
    Namespace = "${var.namespace}"
    Stage = "${var.stage}"
  }
}

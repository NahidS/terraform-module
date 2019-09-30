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

resource "aws_ses_template" "confirm-email-template" {
  name    = "${var.namespace}-${var.stage}-confirm-email-template"
  subject = "{{subject}}",
  html    = ""
}

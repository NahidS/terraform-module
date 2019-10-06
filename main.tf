################################################################################
# S3 buckets
################################################################################


################################################################################
# DynamoDB Resources
################################################################################
module "user-table" {
  source = "git::https://github.com/cloudposse/terraform-aws-dynamodb.git?ref=tags/0.10.0"
  version = "1.66.0"
  namespace = "${var.namespace}"
  stage = "${var.stage}"
  name = "User"
  hash_key = "UserId"
  autoscale_write_target = "80"
  autoscale_read_target = "80"
  autoscale_min_read_capacity = "1"
  autoscale_max_read_capacity = "100"
  autoscale_min_write_capacity = "1"
  autoscale_max_write_capacity = "100"
  dynamodb_attributes = [
    {
      name = "UserId"
      type = "S"
    },
    {
      name = "Email"
      type = "S"
    },
    {
      name = "FacebookId"
      type = "S"
    }
  ]
  enable_encryption = true
  ttl_attribute = "Expires"
  global_secondary_index_map = [
    {
      name = "EmailIndex"
      hash_key = "Email"
      read_capacity = "100"
      write_capacity = "100"
      projection_type = "KEYS_ONLY"
    },
    {
      name = "FacebookIndex"
      hash_key = "FacebookId"
      read_capacity = "100"
      write_capacity = "100"
      projection_type = "KEYS_ONLY"
    }

  ]
}
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



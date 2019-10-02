variable "aws_profile" {
  description = "AWS profile"
  default = "adirit-dev-admin"
}

variable "aws_region" {
  description = "Region to create resources in"
}

variable "namespace" {
  default = "alfredpad"
  description = "Namespace"
}

variable "stage" {
  description = "Stage, can be one of {dev,prd,tst}"
}

variable "bucket_name" {
  description = "Bucket name"
}

variable "alfredpad-log-level" {
  description = "Log level for alfredpad"
  default = "TRACE"
}

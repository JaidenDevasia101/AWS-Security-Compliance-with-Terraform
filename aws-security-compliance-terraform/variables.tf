variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region"
}

variable "project_tag" {
  type        = string
  default     = "tf-compliance-starter"
  description = "Tag to apply to resources"
}

variable "config_bucket_name" {
  type        = string
  description = "Globally-unique S3 bucket name for AWS Config delivery"
}

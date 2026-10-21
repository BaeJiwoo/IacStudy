variable "state_bucket_name" {
  description = "Globally unique S3 bucket name for Terraform state"
  type        = string
}

variable "aws_region" {
  description = "Region that stores Terraform state"
  type        = string
  default     = "ap-northeast-2"
}

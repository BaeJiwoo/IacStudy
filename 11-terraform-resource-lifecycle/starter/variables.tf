variable "aws_region" {
  description = "AWS Region containing the existing bucket"
  type        = string
  default     = "ap-northeast-2"
}

variable "bucket_name" {
  description = "Globally unique name of the existing study bucket"
  type        = string

  validation {
    condition     = length(var.bucket_name) >= 3 && length(var.bucket_name) <= 63
    error_message = "bucket_name must contain between 3 and 63 characters."
  }
}

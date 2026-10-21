variable "aws_region" {
  description = "AWS Region used for the lab"
  type        = string
  default     = "ap-northeast-2"
}

variable "name" {
  description = "Name prefix for lab resources"
  type        = string

  validation {
    condition     = can(regex("^[a-z][a-z0-9-]{2,30}$", var.name))
    error_message = "name must start with a lowercase letter and contain 3 to 31 lowercase letters, numbers, or hyphens."
  }
}

variable "vpc_cidr" {
  description = "IPv4 CIDR assigned to the VPC"
  type        = string
  default     = "10.20.0.0/16"

  validation {
    condition     = can(cidrhost(var.vpc_cidr, 0))
    error_message = "vpc_cidr must be a valid IPv4 CIDR."
  }
}

variable "availability_zones" {
  description = "Availability Zones used by the lab VPC"
  type        = list(string)
  default     = ["ap-northeast-2a", "ap-northeast-2c"]

  validation {
    condition     = length(var.availability_zones) >= 2
    error_message = "At least two Availability Zones are required."
  }
}

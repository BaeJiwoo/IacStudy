variable "name" {
  type        = string
  description = "Name prefix for VPC resources"
}

variable "vpc_cidr" {
  type        = string
  description = "IPv4 CIDR assigned to the VPC"
}

variable "availability_zones" {
  type        = list(string)
  description = "Availability Zones used by the VPC"
}

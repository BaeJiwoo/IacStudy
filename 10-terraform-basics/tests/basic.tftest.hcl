mock_provider "aws" {}

run "valid_plan" {
  command = plan

  variables {
    name               = "iac-study-vpc"
    vpc_cidr           = "10.20.0.0/16"
    availability_zones = ["ap-northeast-2a", "ap-northeast-2c"]
  }

  assert {
    condition     = aws_vpc.this.enable_dns_support
    error_message = "VPC DNS support must be enabled."
  }

  assert {
    condition     = length(aws_subnet.private) == 2
    error_message = "The lab must create one private subnet in each Availability Zone."
  }
}

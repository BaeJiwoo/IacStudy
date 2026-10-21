resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.name
  }
}

# TODO: Move the public and private subnet resources from task 07 into this module.
# TODO: Add explicit public and private route tables.

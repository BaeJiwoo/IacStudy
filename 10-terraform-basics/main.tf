locals {
  common_tags = {
    Project     = var.name
    Environment = "lab"
    ManagedBy   = "terraform"
  }
}

resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.name
  }
}

resource "aws_subnet" "public" {
  for_each = toset(var.availability_zones)

  vpc_id                  = aws_vpc.this.id
  availability_zone       = each.value
  cidr_block              = cidrsubnet(var.vpc_cidr, 4, index(var.availability_zones, each.value))
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.name}-public-${each.value}"
    Tier = "public"
  }
}

resource "aws_subnet" "private" {
  for_each = toset(var.availability_zones)

  vpc_id            = aws_vpc.this.id
  availability_zone = each.value
  cidr_block        = cidrsubnet(var.vpc_cidr, 4, index(var.availability_zones, each.value) + 8)

  tags = {
    Name = "${var.name}-private-${each.value}"
    Tier = "private"
  }
}

# TODO: Add an internet gateway and separate public and private route tables.
# Do not add a NAT gateway until you have reviewed its hourly and data processing cost.

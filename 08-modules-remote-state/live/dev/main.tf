terraform {
  required_version = ">= 1.6, < 2.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0, < 7.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

module "vpc" {
  source = "../../modules/vpc"

  name               = "iac-study-dev"
  vpc_cidr           = "10.30.0.0/16"
  availability_zones = ["ap-northeast-2a", "ap-northeast-2c"]
}

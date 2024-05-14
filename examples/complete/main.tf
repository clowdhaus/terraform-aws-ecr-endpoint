provider "aws" {
  region = local.region
}

# data "aws_availability_zones" "available" {}

locals {
  region = "us-east-1"
  name   = "ex-${basename(path.cwd)}"

  # vpc_cidr = "10.0.0.0/16"
  # azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  tags = {
    Name       = local.name
    Example    = local.name
    Repository = "https://github.com/clowdhaus/terraform-aws-ecr-endpoint"
  }
}

################################################################################
# ecr endpoint Module
################################################################################

module "ecr_endpoint" {
  source = "../.."

  # API
  api_name = local.name

  create_api_domain_name = false

  tags = local.tags
}

module "ecr_endpoint_disabled" {
  source = "../.."

  create = false
}

################################################################################
# Supporting Resources
################################################################################

# module "vpc" {
#   source  = "terraform-aws-modules/vpc/aws"
#   version = "~> 5.0"

#   name = local.name
#   cidr = local.vpc_cidr

#   azs             = local.azs
#   public_subnets  = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k)]
#   private_subnets = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 10)]

#   enable_nat_gateway = true
#   single_nat_gateway = true

#   tags = local.tags
# }

provider "aws" {
  region = local.region
}

locals {
  region = "us-east-1"
  name   = "ex-${basename(path.cwd)}"

  domain = "sharedservices.clowd.haus"

  tags = {
    Name       = local.name
    Example    = local.name
    Repository = "https://github.com/clowdhaus/terraform-aws-ecr-endpoint"
  }
}

################################################################################
# ECR Endpoint Module
################################################################################

module "ecr_endpoint" {
  source = "../.."

  name        = local.name
  description = "Example public ECR Endpoint"

  # API
  api_name        = local.name
  api_domain_name = "*.${local.domain}"
  api_subdomains  = ["ecr"]

  # Lambda


  tags = local.tags
}

module "ecr_endpoint_disabled" {
  source = "../.."

  create = false
}

################################################################################
# Supporting Resources
################################################################################

module "ecr" {
  source  = "terraform-aws-modules/ecr/aws"
  version = "~> 2.0"

  repository_name = local.name

  repository_force_delete = true # For example only
  create_lifecycle_policy = false

  tags = local.tags
}

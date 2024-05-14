module "api_gateway" {
  source = "git::https://github.com/bryantbiggs/terraform-aws-apigateway-v2.git?ref=95fcb7a077f008d32733edcdda96d4a4c54eec27"

  create = var.create && var.create_api

  # API Gateway
  cors_configuration           = var.api_cors_configuration
  credentials_arn              = var.api_credentials_arn
  description                  = var.api_description
  disable_execute_api_endpoint = var.api_disable_execute_api_endpoint
  fail_on_warnings             = var.api_fail_on_warnings
  name                         = var.api_name
  body                         = var.api_body
  protocol_type                = "HTTP"
  route_key                    = var.api_route_key
  route_selection_expression   = var.api_route_selection_expression
  target                       = var.api_target
  api_version                  = var.api_version
  api_mapping_key              = var.api_mapping_key

  # Authorizer(s)
  authorizers = var.api_authorizers

  # Domain Name
  create_domain_name                                 = var.create_api_domain_name
  domain_name                                        = var.api_domain_name
  domain_name_certificate_arn                        = var.api_domain_name_certificate_arn
  domain_name_ownership_verification_certificate_arn = var.api_domain_name_ownership_verification_certificate_arn

  # Domain - Route53 Records
  create_domain_records = var.create_api_domain_records
  subdomains            = var.api_subdomains

  # Domain - Certificate
  create_certificate = var.create_api_certificate

  # Route(s) & Integration(s)
  routes = var.api_routes

  # Stage
  stage_access_log_settings    = var.api_stage_access_log_settings
  stage_default_route_settings = var.api_stage_default_route_settings
  stage_description            = var.api_stage_description
  stage_name                   = var.api_stage_name
  stage_variables              = var.api_stage_variables
  stage_tags                   = var.api_stage_tags

  # VPC Link
  vpc_links     = var.api_vpc_links
  vpc_link_tags = var.api_vpc_link_tags

  tags = merge(var.tags, var.api_tags)
}

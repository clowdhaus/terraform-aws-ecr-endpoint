################################################################################
# API Gateway
################################################################################

output "api_id" {
  description = "The API identifier"
  value       = module.api_gateway.api_id
}

output "api_endpoint" {
  description = "URI of the API, of the form `https://{api-id}.execute-api.{region}.amazonaws.com`"
  value       = module.api_gateway.api_endpoint
}

output "api_arn" {
  description = "The ARN of the API"
  value       = module.api_gateway.api_arn
}

output "api_execution_arn" {
  description = "The ARN prefix to be used in an `aws_lambda_permission`'s `source_arn` attribute or in an `aws_iam_policy` to authorize access to the `@connections` API"
  value       = module.api_gateway.api_execution_arn
}

################################################################################
# Authorizer(s)
################################################################################

output "api_authorizers" {
  description = "Map of API Gateway Authorizer(s) created and their attributes"
  value       = module.api_gateway.authorizers
}

################################################################################
# Domain Name
################################################################################

output "api_domain_name_id" {
  description = "The domain name identifier"
  value       = module.api_gateway.domain_name_id
}

output "api_domain_name_arn" {
  description = "The ARN of the domain name"
  value       = module.api_gateway.domain_name_arn
}

output "api_domain_name_api_mapping_selection_expression" {
  description = "The API mapping selection expression for the domain name"
  value       = module.api_gateway.domain_name_api_mapping_selection_expression
}

output "api_domain_name_configuration" {
  description = "The domain name configuration"
  value       = module.api_gateway.domain_name_configuration
}

output "api_domain_name_target_domain_name" {
  description = "The target domain name"
  value       = module.api_gateway.domain_name_target_domain_name
}

output "api_domain_name_hosted_zone_id" {
  description = "The Amazon Route 53 Hosted Zone ID of the endpoint"
  value       = module.api_gateway.domain_name_hosted_zone_id
}

################################################################################
# Domain - Certificate
################################################################################

output "api_acm_certificate_arn" {
  description = "The ARN of the certificate"
  value       = module.api_gateway.acm_certificate_arn
}

################################################################################
# Integration(s)
################################################################################

output "api_integrations" {
  description = "Map of the integrations created and their attributes"
  value       = module.api_gateway.integrations
}

################################################################################
# Route(s)
################################################################################

output "api_routes" {
  description = "Map of the routes created and their attributes"
  value       = module.api_gateway.routes
}

################################################################################
# Stage
################################################################################

output "api_stage_id" {
  description = "The stage identifier"
  value       = module.api_gateway.stage_id
}

output "api_stage_arn" {
  description = "The stage ARN"
  value       = module.api_gateway.stage_arn
}

output "api_stage_execution_arn" {
  description = "The ARN prefix to be used in an aws_lambda_permission's source_arn attribute or in an aws_iam_policy to authorize access to the @connections API"
  value       = module.api_gateway.stage_execution_arn
}

output "api_stage_invoke_url" {
  description = "The URL to invoke the API pointing to the stage"
  value       = module.api_gateway.stage_invoke_url
}

################################################################################
# Stage Access Logs - Log Group
################################################################################

output "api_stage_access_logs_cloudwatch_log_group_name" {
  description = "Name of cloudwatch log group created"
  value       = module.api_gateway.stage_access_logs_cloudwatch_log_group_name
}

output "api_stage_access_logs_cloudwatch_log_group_arn" {
  description = "Arn of cloudwatch log group created"
  value       = module.api_gateway.stage_access_logs_cloudwatch_log_group_arn
}

################################################################################
# VPC Link
################################################################################

output "api_vpc_links" {
  description = "Map of VPC links created and their attributes"
  value       = module.api_gateway.vpc_links
}

################################################################################
# Lambda Function
################################################################################

output "lambda_function_arn" {
  description = "The ARN of the Lambda Function"
  value       = module.lambda_function.lambda_function_arn
}

output "lambda_function_name" {
  description = "The name of the Lambda Function"
  value       = module.lambda_function.lambda_function_name
}

output "lambda_function_qualified_arn" {
  description = "The ARN identifying your Lambda Function Version"
  value       = module.lambda_function.lambda_function_qualified_arn
}

################################################################################
# Lambda IAM Role
################################################################################

output "lambda_role_arn" {
  description = "The ARN of the IAM role created for the Lambda Function"
  value       = module.lambda_function.lambda_role_arn
}

output "lambda_role_name" {
  description = "The name of the IAM role created for the Lambda Function"
  value       = module.lambda_function.lambda_role_name
}

output "lambda_role_unique_id" {
  description = "The unique id of the IAM role created for the Lambda Function"
  value       = module.lambda_function.lambda_role_unique_id
}

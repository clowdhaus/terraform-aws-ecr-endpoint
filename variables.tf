variable "create" {
  description = "Controls if resources should be created"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A mapping of tags to assign to resources created"
  type        = map(string)
  default     = {}
}

variable "name" {
  description = "Common name used across the resources created if a more specific resource name is not provided"
  type        = string
  default     = "ecr-endpoint"
}

variable "description" {
  description = "Common description used across the resources created if a more specific resource description is not provided"
  type        = string
  default     = "ECR custom endpoint"
}

################################################################################
# API Gateway
################################################################################

variable "create_api" {
  description = "Whether to create API Gateway resource"
  type        = bool
  default     = true
}

variable "api_cors_configuration" {
  description = "The cross-origin resource sharing (CORS) configuration"
  type = object({
    allow_credentials = optional(bool)
    allow_headers     = optional(list(string))
    allow_methods     = optional(list(string))
    allow_origins     = optional(list(string))
    expose_headers    = optional(list(string), [])
    max_age           = optional(number)
  })
  default = {}
}

variable "api_credentials_arn" {
  description = "Part of quick create. Specifies any credentials required for the integration. Applicable for HTTP APIs"
  type        = string
  default     = null
}

variable "api_description" {
  description = "The description of the API. Must be less than or equal to 1024 characters in length"
  type        = string
  default     = null
}

variable "api_disable_execute_api_endpoint" {
  description = "Whether clients can invoke the API by using the default execute-api endpoint. By default, clients can invoke the API with the default `{api_id}.execute-api.{region}.amazonaws.com endpoint`. To require that clients use a custom domain name to invoke the API, disable the default endpoint"
  type        = bool
  default     = null
}

variable "api_fail_on_warnings" {
  description = "Whether warnings should return an error while API Gateway is creating or updating the resource using an OpenAPI specification. Defaults to `false`. Applicable for HTTP APIs"
  type        = bool
  default     = null
}

variable "api_name" {
  description = "The name of the API. Must be less than or equal to 128 characters in length"
  type        = string
  default     = ""
}

variable "api_body" {
  description = "An OpenAPI specification that defines the set of routes and integrations to create as part of the HTTP APIs. Supported only for HTTP APIs"
  type        = string
  default     = null
}

variable "api_route_key" {
  description = "Part of quick create. Specifies any route key"
  type        = string
  default     = null
}

variable "api_route_selection_expression" {
  description = "The route selection expression for the API. Defaults to `$request.method $request.path`"
  type        = string
  default     = null
}

variable "api_target" {
  description = "Part of quick create. Quick create produces an API with an integration, a default catch-all route, and a default stage which is configured to automatically deploy changes. For HTTP integrations, specify a fully qualified URL. For Lambda integrations, specify a function ARN. The type of the integration will be HTTP_PROXY or AWS_PROXY, respectively. Applicable for HTTP APIs"
  type        = string
  default     = null
}

variable "api_version" {
  description = "A version identifier for the API. Must be between 1 and 64 characters in length"
  type        = string
  default     = null
}

variable "api_mapping_key" {
  description = "The [API mapping key](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-mapping-template-reference.html)"
  type        = string
  default     = null
}

variable "api_tags" {
  description = "A mapping of tags to assign to the API Gateway resources"
  type        = map(string)
  default     = {}
}

################################################################################
# Authorizer(s)
################################################################################

variable "api_authorizers" {
  description = "Map of API gateway authorizers to create"
  type = map(object({
    authorizer_credentials_arn        = optional(string)
    authorizer_payload_format_version = optional(string)
    authorizer_result_ttl_in_seconds  = optional(number)
    authorizer_type                   = optional(string, "REQUEST")
    authorizer_uri                    = optional(string)
    enable_simple_responses           = optional(bool)
    identity_sources                  = optional(list(string))
    jwt_configuration = optional(object({
      audience = optional(list(string))
      issuer   = optional(string)
    }), {})
    name = optional(string)
  }))
  default = {}
}

################################################################################
# Domain Name
################################################################################

variable "create_api_domain_name" {
  description = "Whether to create API domain name resource"
  type        = bool
  default     = true
}

variable "api_domain_name" {
  description = "The domain name to use for API gateway"
  type        = string
  default     = ""
}

variable "api_domain_name_certificate_arn" {
  description = "The ARN of an AWS-managed certificate that will be used by the endpoint for the domain name. AWS Certificate Manager is the only supported source"
  type        = string
  default     = null
}

variable "api_domain_name_ownership_verification_certificate_arn" {
  description = "ARN of the AWS-issued certificate used to validate custom domain ownership (when certificate_arn is issued via an ACM Private CA or mutual_tls_authentication is configured with an ACM-imported certificate.)"
  type        = string
  default     = null
}

################################################################################
# Domain - Route53 Record
################################################################################

variable "create_api_domain_records" {
  description = "Whether to create Route53 records for the domain name"
  type        = bool
  default     = true
}

variable "api_subdomains" {
  description = "An optional list of subdomains to use for API gateway"
  type        = list(string)
  default     = []
}

################################################################################
# Domain - Certificate
################################################################################

variable "create_api_certificate" {
  description = "Whether to create a certificate for the domain"
  type        = bool
  default     = true
}

################################################################################
# Integration(s)
################################################################################

variable "api_routes" {
  description = "Map of API gateway routes with integrations"
  # We can't use full type object due to `merge()` function - I don't know why yet
  type = any
  default = {
    "ANY /{proxy+}" = {
      integration = {}
    }
  }
}

################################################################################
# Stage
################################################################################

variable "api_stage_access_log_settings" {
  description = "Settings for logging access in this stage. Use the aws_api_gateway_account resource to configure [permissions for CloudWatch Logging](https://docs.aws.amazon.com/apigateway/latest/developerguide/set-up-logging.html#set-up-access-logging-permissions)"
  type = object({
    create_log_group            = optional(bool, true)
    destination_arn             = optional(string)
    format                      = optional(string)
    log_group_name              = optional(string)
    log_group_retention_in_days = optional(number, 30)
    log_group_kms_key_id        = optional(string)
    log_group_skip_destroy      = optional(bool)
    log_group_class             = optional(string)
    log_group_tags              = optional(map(string), {})
  })
  default = {}
}

variable "api_stage_default_route_settings" {
  description = "The default route settings for the stage"
  type = object({
    data_trace_enabled       = optional(bool, false)
    detailed_metrics_enabled = optional(bool, false)
    logging_level            = optional(string)
    throttling_burst_limit   = optional(number, 500)
    throttling_rate_limit    = optional(number, 1000)
  })
  default = {}
}

variable "api_stage_description" {
  description = "The description for the stage. Must be less than or equal to 1024 characters in length"
  type        = string
  default     = null
}

variable "api_stage_name" {
  description = "The name of the stage. Must be between 1 and 128 characters in length"
  type        = string
  default     = "$default"
}

variable "api_stage_variables" {
  description = "A map that defines the stage variables for the stage"
  type        = map(string)
  default     = {}
}

variable "api_stage_tags" {
  description = "A mapping of tags to assign to the stage resource"
  type        = map(string)
  default     = {}
}

################################################################################
# VPC Link
################################################################################

variable "api_vpc_links" {
  description = "Map of VPC Link definitions to create"
  type = map(object({
    name               = optional(string)
    security_group_ids = optional(list(string))
    subnet_ids         = optional(list(string))
    tags               = optional(map(string), {})
  }))
  default = {}
}

variable "api_vpc_link_tags" {
  description = "A map of tags to add to the VPC Links created"
  type        = map(string)
  default     = {}
}

################################################################################
# Lambda Function
################################################################################

variable "create_lambda" {
  description = "Whether to create Lambda function resource"
  type        = bool
  default     = true
}

variable "lambda_name" {
  description = "The name of the Lambda function"
  type        = string
  default     = ""
}

variable "lambda_description" {
  description = "The description of the Lambda function"
  type        = string
  default     = ""
}

variable "lambda_runtime" {
  description = "The runtime environment for the Lambda function"
  type        = string
  default     = "python3.12"
}

variable "lambda_architectures" {
  description = "The architectures supported by the Lambda function"
  type        = list(string)
  default     = ["arm64"]
}

variable "lambda_kms_key_arn" {
  description = "The ARN of KMS key to use by your Lambda Function"
  type        = string
  default     = null
}

variable "lambda_memory_size" {
  description = "Amount of memory in MB your Lambda Function can use at runtime. Valid value between 128 MB to 10,240 MB (10 GB), in 64 MB increments."
  type        = number
  default     = 256
}

variable "lambda_reserved_concurrent_executions" {
  description = "The amount of reserved concurrent executions for this Lambda Function. A value of 0 disables Lambda Function from being triggered and -1 removes any concurrency limitations. Defaults to Unreserved Concurrency Limits -1."
  type        = number
  default     = -1
}

variable "lambda_provisioned_concurrent_executions" {
  description = "Amount of capacity to allocate. Set to 1 or greater to enable, or set to 0 to disable provisioned concurrency."
  type        = number
  default     = -1
}

variable "lambda_timeout" {
  description = "The amount of time your Lambda Function has to run in seconds."
  type        = number
  default     = 3
}

variable "lambda_tracing_mode" {
  description = "Tracing mode of the Lambda Function. Valid value can be either `PassThrough` or `Active`"
  type        = string
  default     = null
}

variable "lambda_attach_tracing_policy" {
  description = "Controls whether X-Ray tracing policy should be added to IAM role for Lambda Function"
  type        = bool
  default     = false
}

variable "create_lambda_role" {
  description = "Controls whether IAM role for Lambda Function should be created"
  type        = bool
  default     = true
}

variable "lambda_role" {
  description = " IAM role ARN attached to the Lambda Function. This governs both who / what can invoke your Lambda Function, as well as what resources our Lambda Function has access to. See Lambda Permission Model for more details."
  type        = string
  default     = ""
}

variable "lambda_role_description" {
  description = "Description of IAM role to use for Lambda Function"
  type        = string
  default     = null
}

variable "lambda_role_permissions_boundary" {
  description = "The ARN of the policy that is used to set the permissions boundary for the IAM role used by Lambda Function"
  type        = string
  default     = null
}

variable "lambda_role_maximum_session_duration" {
  description = "Maximum session duration, in seconds, for the IAM role"
  type        = number
  default     = null
}

variable "lambda_vpc_subnet_ids" {
  description = "List of subnet ids when Lambda Function should run in the VPC. Usually private or intra subnets."
  type        = list(string)
  default     = null
}

variable "lambda_vpc_security_group_ids" {
  description = "List of security group ids when Lambda Function should run in the VPC."
  type        = list(string)
  default     = null
}

variable "lambda_attach_network_policy" {
  description = "Controls whether VPC/network policy should be added to IAM role for Lambda Function"
  type        = bool
  default     = false
}

variable "create_lambda_cloudwatch_log_group" {
  description = "Whether to create a CloudWatch log group"
  type        = bool
  default     = true
}

variable "lambda_cloudwatch_logs_retention_in_days" {
  description = "Specifies the number of days you want to retain log events in the specified log group. Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1827, and 3653."
  type        = number
  default     = null
}

variable "lambda_cloudwatch_logs_kms_key_id" {
  description = "The ARN of the KMS Key to use when encrypting log data."
  type        = string
  default     = null
}

variable "lambda_cloudwatch_logs_log_group_class" {
  description = "Specified the log class of the log group. Possible values are: `STANDARD` or `INFREQUENT_ACCESS`"
  type        = string
  default     = null
}

variable "lambda_environment_variables" {
  description = "A mapping of environment variables to assign to the Lambda function"
  type        = map(string)
  default     = {}
}

variable "lambda_tags" {
  description = "A mapping of tags to assign to the Lambda function"
  type        = map(string)
  default     = {}
}

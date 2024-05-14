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
  type = map(object({
    # Route
    authorizer_key             = optional(string)
    api_key_required           = optional(bool)
    authorization_scopes       = optional(list(string), [])
    authorization_type         = optional(string)
    authorizer_id              = optional(string)
    model_selection_expression = optional(string)
    operation_name             = optional(string)
    request_models             = optional(map(string), {})
    request_parameter = optional(object({
      request_parameter_key = optional(string)
      required              = optional(bool, false)
    }), {})
    route_response_selection_expression = optional(string)

    # Route settings
    data_trace_enabled       = optional(bool, false)
    detailed_metrics_enabled = optional(bool, false)
    logging_level            = optional(string)
    throttling_burst_limit   = optional(number, 500)
    throttling_rate_limit    = optional(number, 1000)

    # Stage - Route response
    route_response = optional(object({
      create                     = optional(bool, false)
      model_selection_expression = optional(string)
      response_models            = optional(map(string))
      route_response_key         = optional(string, "$default")
    }), {})

    # Integration
    integration = object({
      connection_id             = optional(string)
      vpc_link_key              = optional(string)
      connection_type           = optional(string)
      content_handling_strategy = optional(string)
      credentials_arn           = optional(string)
      description               = optional(string)
      method                    = optional(string)
      subtype                   = optional(string)
      type                      = optional(string, "AWS_PROXY")
      uri                       = optional(string)
      passthrough_behavior      = optional(string)
      payload_format_version    = optional(string)
      request_parameters        = optional(map(string), {})
      request_templates         = optional(map(string), {})
      response_parameters = optional(list(object({
        mappings    = map(string)
        status_code = string
      })))
      template_selection_expression = optional(string)
      timeout_milliseconds          = optional(number)
      tls_config = optional(object({
        server_name_to_verify = optional(string)
      }), {})

      # Integration Response
      response = optional(object({
        content_handling_strategy     = optional(string)
        integration_response_key      = optional(string)
        response_templates            = optional(map(string))
        template_selection_expression = optional(string)
      }), {})
    })
  }))
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

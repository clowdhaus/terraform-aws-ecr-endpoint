# Amazon ECR Endpoint Terraform module

Terraform module which creates a custom endpoint for Amazon ECR.

## Usage

See [`examples`](https://github.com/clowdhaus/terraform-aws-ecr-endpoint/tree/main/examples) directory for working examples to reference:

```hcl
module "ecr_endpoint" {
  source = "clowdhaus/ecr-endpoint/aws"

  name        = "Example"
  description = "Example public ECR Endpoint"

  # API
  api_domain_name = "*.myorganization.com"
  api_subdomains  = ["ecr"]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
```

## Examples

Examples codified under the [`examples`](https://github.com/clowdhaus/terraform-aws-ecr-endpoint/tree/main/examples) are intended to give users references for how to use the module(s) as well as testing/validating changes to the source code of the module. If contributing to the project, please be sure to make any appropriate updates to the relevant examples to allow maintainers to test your changes and to keep the examples up to date for users. Thank you!

- [Complete](https://github.com/clowdhaus/terraform-aws-ecr-endpoint/tree/main/examples/complete)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.37 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.37 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_api_gateway"></a> [api\_gateway](#module\_api\_gateway) | git::https://github.com/bryantbiggs/terraform-aws-apigateway-v2.git | 95fcb7a077f008d32733edcdda96d4a4c54eec27 |
| <a name="module_lambda_function"></a> [lambda\_function](#module\_lambda\_function) | terraform-aws-modules/lambda/aws | 7.4.0 |

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_authorizers"></a> [api\_authorizers](#input\_api\_authorizers) | Map of API gateway authorizers to create | <pre>map(object({<br>    authorizer_credentials_arn        = optional(string)<br>    authorizer_payload_format_version = optional(string)<br>    authorizer_result_ttl_in_seconds  = optional(number)<br>    authorizer_type                   = optional(string, "REQUEST")<br>    authorizer_uri                    = optional(string)<br>    enable_simple_responses           = optional(bool)<br>    identity_sources                  = optional(list(string))<br>    jwt_configuration = optional(object({<br>      audience = optional(list(string))<br>      issuer   = optional(string)<br>    }), {})<br>    name = optional(string)<br>  }))</pre> | `{}` | no |
| <a name="input_api_body"></a> [api\_body](#input\_api\_body) | An OpenAPI specification that defines the set of routes and integrations to create as part of the HTTP APIs. Supported only for HTTP APIs | `string` | `null` | no |
| <a name="input_api_cors_configuration"></a> [api\_cors\_configuration](#input\_api\_cors\_configuration) | The cross-origin resource sharing (CORS) configuration | <pre>object({<br>    allow_credentials = optional(bool)<br>    allow_headers     = optional(list(string))<br>    allow_methods     = optional(list(string))<br>    allow_origins     = optional(list(string))<br>    expose_headers    = optional(list(string), [])<br>    max_age           = optional(number)<br>  })</pre> | `{}` | no |
| <a name="input_api_credentials_arn"></a> [api\_credentials\_arn](#input\_api\_credentials\_arn) | Part of quick create. Specifies any credentials required for the integration. Applicable for HTTP APIs | `string` | `null` | no |
| <a name="input_api_description"></a> [api\_description](#input\_api\_description) | The description of the API. Must be less than or equal to 1024 characters in length | `string` | `null` | no |
| <a name="input_api_disable_execute_api_endpoint"></a> [api\_disable\_execute\_api\_endpoint](#input\_api\_disable\_execute\_api\_endpoint) | Whether clients can invoke the API by using the default execute-api endpoint. By default, clients can invoke the API with the default `{api_id}.execute-api.{region}.amazonaws.com endpoint`. To require that clients use a custom domain name to invoke the API, disable the default endpoint | `bool` | `null` | no |
| <a name="input_api_domain_name"></a> [api\_domain\_name](#input\_api\_domain\_name) | The domain name to use for API gateway | `string` | `""` | no |
| <a name="input_api_domain_name_certificate_arn"></a> [api\_domain\_name\_certificate\_arn](#input\_api\_domain\_name\_certificate\_arn) | The ARN of an AWS-managed certificate that will be used by the endpoint for the domain name. AWS Certificate Manager is the only supported source | `string` | `null` | no |
| <a name="input_api_domain_name_ownership_verification_certificate_arn"></a> [api\_domain\_name\_ownership\_verification\_certificate\_arn](#input\_api\_domain\_name\_ownership\_verification\_certificate\_arn) | ARN of the AWS-issued certificate used to validate custom domain ownership (when certificate\_arn is issued via an ACM Private CA or mutual\_tls\_authentication is configured with an ACM-imported certificate.) | `string` | `null` | no |
| <a name="input_api_fail_on_warnings"></a> [api\_fail\_on\_warnings](#input\_api\_fail\_on\_warnings) | Whether warnings should return an error while API Gateway is creating or updating the resource using an OpenAPI specification. Defaults to `false`. Applicable for HTTP APIs | `bool` | `null` | no |
| <a name="input_api_mapping_key"></a> [api\_mapping\_key](#input\_api\_mapping\_key) | The [API mapping key](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-mapping-template-reference.html) | `string` | `null` | no |
| <a name="input_api_name"></a> [api\_name](#input\_api\_name) | The name of the API. Must be less than or equal to 128 characters in length | `string` | `""` | no |
| <a name="input_api_route_key"></a> [api\_route\_key](#input\_api\_route\_key) | Part of quick create. Specifies any route key | `string` | `null` | no |
| <a name="input_api_route_selection_expression"></a> [api\_route\_selection\_expression](#input\_api\_route\_selection\_expression) | The route selection expression for the API. Defaults to `$request.method $request.path` | `string` | `null` | no |
| <a name="input_api_routes"></a> [api\_routes](#input\_api\_routes) | Map of API gateway routes with integrations | `any` | <pre>{<br>  "ANY /{proxy+}": {<br>    "integration": {}<br>  }<br>}</pre> | no |
| <a name="input_api_stage_access_log_settings"></a> [api\_stage\_access\_log\_settings](#input\_api\_stage\_access\_log\_settings) | Settings for logging access in this stage. Use the aws\_api\_gateway\_account resource to configure [permissions for CloudWatch Logging](https://docs.aws.amazon.com/apigateway/latest/developerguide/set-up-logging.html#set-up-access-logging-permissions) | <pre>object({<br>    create_log_group            = optional(bool, true)<br>    destination_arn             = optional(string)<br>    format                      = optional(string)<br>    log_group_name              = optional(string)<br>    log_group_retention_in_days = optional(number, 30)<br>    log_group_kms_key_id        = optional(string)<br>    log_group_skip_destroy      = optional(bool)<br>    log_group_class             = optional(string)<br>    log_group_tags              = optional(map(string), {})<br>  })</pre> | `{}` | no |
| <a name="input_api_stage_default_route_settings"></a> [api\_stage\_default\_route\_settings](#input\_api\_stage\_default\_route\_settings) | The default route settings for the stage | <pre>object({<br>    data_trace_enabled       = optional(bool, false)<br>    detailed_metrics_enabled = optional(bool, false)<br>    logging_level            = optional(string)<br>    throttling_burst_limit   = optional(number, 500)<br>    throttling_rate_limit    = optional(number, 1000)<br>  })</pre> | `{}` | no |
| <a name="input_api_stage_description"></a> [api\_stage\_description](#input\_api\_stage\_description) | The description for the stage. Must be less than or equal to 1024 characters in length | `string` | `null` | no |
| <a name="input_api_stage_name"></a> [api\_stage\_name](#input\_api\_stage\_name) | The name of the stage. Must be between 1 and 128 characters in length | `string` | `"$default"` | no |
| <a name="input_api_stage_tags"></a> [api\_stage\_tags](#input\_api\_stage\_tags) | A mapping of tags to assign to the stage resource | `map(string)` | `{}` | no |
| <a name="input_api_stage_variables"></a> [api\_stage\_variables](#input\_api\_stage\_variables) | A map that defines the stage variables for the stage | `map(string)` | `{}` | no |
| <a name="input_api_subdomains"></a> [api\_subdomains](#input\_api\_subdomains) | An optional list of subdomains to use for API gateway | `list(string)` | `[]` | no |
| <a name="input_api_tags"></a> [api\_tags](#input\_api\_tags) | A mapping of tags to assign to the API Gateway resources | `map(string)` | `{}` | no |
| <a name="input_api_target"></a> [api\_target](#input\_api\_target) | Part of quick create. Quick create produces an API with an integration, a default catch-all route, and a default stage which is configured to automatically deploy changes. For HTTP integrations, specify a fully qualified URL. For Lambda integrations, specify a function ARN. The type of the integration will be HTTP\_PROXY or AWS\_PROXY, respectively. Applicable for HTTP APIs | `string` | `null` | no |
| <a name="input_api_version"></a> [api\_version](#input\_api\_version) | A version identifier for the API. Must be between 1 and 64 characters in length | `string` | `null` | no |
| <a name="input_api_vpc_link_tags"></a> [api\_vpc\_link\_tags](#input\_api\_vpc\_link\_tags) | A map of tags to add to the VPC Links created | `map(string)` | `{}` | no |
| <a name="input_api_vpc_links"></a> [api\_vpc\_links](#input\_api\_vpc\_links) | Map of VPC Link definitions to create | <pre>map(object({<br>    name               = optional(string)<br>    security_group_ids = optional(list(string))<br>    subnet_ids         = optional(list(string))<br>    tags               = optional(map(string), {})<br>  }))</pre> | `{}` | no |
| <a name="input_create"></a> [create](#input\_create) | Controls if resources should be created | `bool` | `true` | no |
| <a name="input_create_api"></a> [create\_api](#input\_create\_api) | Whether to create API Gateway resource | `bool` | `true` | no |
| <a name="input_create_api_certificate"></a> [create\_api\_certificate](#input\_create\_api\_certificate) | Whether to create a certificate for the domain | `bool` | `true` | no |
| <a name="input_create_api_domain_name"></a> [create\_api\_domain\_name](#input\_create\_api\_domain\_name) | Whether to create API domain name resource | `bool` | `true` | no |
| <a name="input_create_api_domain_records"></a> [create\_api\_domain\_records](#input\_create\_api\_domain\_records) | Whether to create Route53 records for the domain name | `bool` | `true` | no |
| <a name="input_create_lambda"></a> [create\_lambda](#input\_create\_lambda) | Whether to create Lambda function resource | `bool` | `true` | no |
| <a name="input_create_lambda_cloudwatch_log_group"></a> [create\_lambda\_cloudwatch\_log\_group](#input\_create\_lambda\_cloudwatch\_log\_group) | Whether to create a CloudWatch log group | `bool` | `true` | no |
| <a name="input_create_lambda_role"></a> [create\_lambda\_role](#input\_create\_lambda\_role) | Controls whether IAM role for Lambda Function should be created | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input\_description) | Common description used across the resources created if a more specific resource description is not provided | `string` | `"ECR custom endpoint"` | no |
| <a name="input_lambda_architectures"></a> [lambda\_architectures](#input\_lambda\_architectures) | The architectures supported by the Lambda function | `list(string)` | <pre>[<br>  "arm64"<br>]</pre> | no |
| <a name="input_lambda_attach_network_policy"></a> [lambda\_attach\_network\_policy](#input\_lambda\_attach\_network\_policy) | Controls whether VPC/network policy should be added to IAM role for Lambda Function | `bool` | `false` | no |
| <a name="input_lambda_attach_tracing_policy"></a> [lambda\_attach\_tracing\_policy](#input\_lambda\_attach\_tracing\_policy) | Controls whether X-Ray tracing policy should be added to IAM role for Lambda Function | `bool` | `false` | no |
| <a name="input_lambda_cloudwatch_logs_kms_key_id"></a> [lambda\_cloudwatch\_logs\_kms\_key\_id](#input\_lambda\_cloudwatch\_logs\_kms\_key\_id) | The ARN of the KMS Key to use when encrypting log data. | `string` | `null` | no |
| <a name="input_lambda_cloudwatch_logs_log_group_class"></a> [lambda\_cloudwatch\_logs\_log\_group\_class](#input\_lambda\_cloudwatch\_logs\_log\_group\_class) | Specified the log class of the log group. Possible values are: `STANDARD` or `INFREQUENT_ACCESS` | `string` | `null` | no |
| <a name="input_lambda_cloudwatch_logs_retention_in_days"></a> [lambda\_cloudwatch\_logs\_retention\_in\_days](#input\_lambda\_cloudwatch\_logs\_retention\_in\_days) | Specifies the number of days you want to retain log events in the specified log group. Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1827, and 3653. | `number` | `null` | no |
| <a name="input_lambda_description"></a> [lambda\_description](#input\_lambda\_description) | The description of the Lambda function | `string` | `""` | no |
| <a name="input_lambda_environment_variables"></a> [lambda\_environment\_variables](#input\_lambda\_environment\_variables) | A mapping of environment variables to assign to the Lambda function | `map(string)` | `{}` | no |
| <a name="input_lambda_kms_key_arn"></a> [lambda\_kms\_key\_arn](#input\_lambda\_kms\_key\_arn) | The ARN of KMS key to use by your Lambda Function | `string` | `null` | no |
| <a name="input_lambda_memory_size"></a> [lambda\_memory\_size](#input\_lambda\_memory\_size) | Amount of memory in MB your Lambda Function can use at runtime. Valid value between 128 MB to 10,240 MB (10 GB), in 64 MB increments. | `number` | `256` | no |
| <a name="input_lambda_name"></a> [lambda\_name](#input\_lambda\_name) | The name of the Lambda function | `string` | `""` | no |
| <a name="input_lambda_provisioned_concurrent_executions"></a> [lambda\_provisioned\_concurrent\_executions](#input\_lambda\_provisioned\_concurrent\_executions) | Amount of capacity to allocate. Set to 1 or greater to enable, or set to 0 to disable provisioned concurrency. | `number` | `-1` | no |
| <a name="input_lambda_reserved_concurrent_executions"></a> [lambda\_reserved\_concurrent\_executions](#input\_lambda\_reserved\_concurrent\_executions) | The amount of reserved concurrent executions for this Lambda Function. A value of 0 disables Lambda Function from being triggered and -1 removes any concurrency limitations. Defaults to Unreserved Concurrency Limits -1. | `number` | `-1` | no |
| <a name="input_lambda_role"></a> [lambda\_role](#input\_lambda\_role) | IAM role ARN attached to the Lambda Function. This governs both who / what can invoke your Lambda Function, as well as what resources our Lambda Function has access to. See Lambda Permission Model for more details. | `string` | `""` | no |
| <a name="input_lambda_role_description"></a> [lambda\_role\_description](#input\_lambda\_role\_description) | Description of IAM role to use for Lambda Function | `string` | `null` | no |
| <a name="input_lambda_role_maximum_session_duration"></a> [lambda\_role\_maximum\_session\_duration](#input\_lambda\_role\_maximum\_session\_duration) | Maximum session duration, in seconds, for the IAM role | `number` | `60` | no |
| <a name="input_lambda_role_permissions_boundary"></a> [lambda\_role\_permissions\_boundary](#input\_lambda\_role\_permissions\_boundary) | The ARN of the policy that is used to set the permissions boundary for the IAM role used by Lambda Function | `string` | `null` | no |
| <a name="input_lambda_runtime"></a> [lambda\_runtime](#input\_lambda\_runtime) | The runtime environment for the Lambda function | `string` | `"python3.12"` | no |
| <a name="input_lambda_tags"></a> [lambda\_tags](#input\_lambda\_tags) | A mapping of tags to assign to the Lambda function | `map(string)` | `{}` | no |
| <a name="input_lambda_timeout"></a> [lambda\_timeout](#input\_lambda\_timeout) | The amount of time your Lambda Function has to run in seconds. | `number` | `3` | no |
| <a name="input_lambda_tracing_mode"></a> [lambda\_tracing\_mode](#input\_lambda\_tracing\_mode) | Tracing mode of the Lambda Function. Valid value can be either `PassThrough` or `Active` | `string` | `null` | no |
| <a name="input_lambda_vpc_security_group_ids"></a> [lambda\_vpc\_security\_group\_ids](#input\_lambda\_vpc\_security\_group\_ids) | List of security group ids when Lambda Function should run in the VPC. | `list(string)` | `null` | no |
| <a name="input_lambda_vpc_subnet_ids"></a> [lambda\_vpc\_subnet\_ids](#input\_lambda\_vpc\_subnet\_ids) | List of subnet ids when Lambda Function should run in the VPC. Usually private or intra subnets. | `list(string)` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Common name used across the resources created if a more specific resource name is not provided | `string` | `"ecr-endpoint"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to resources created | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_api_acm_certificate_arn"></a> [api\_acm\_certificate\_arn](#output\_api\_acm\_certificate\_arn) | The ARN of the certificate |
| <a name="output_api_arn"></a> [api\_arn](#output\_api\_arn) | The ARN of the API |
| <a name="output_api_authorizers"></a> [api\_authorizers](#output\_api\_authorizers) | Map of API Gateway Authorizer(s) created and their attributes |
| <a name="output_api_domain_name_api_mapping_selection_expression"></a> [api\_domain\_name\_api\_mapping\_selection\_expression](#output\_api\_domain\_name\_api\_mapping\_selection\_expression) | The API mapping selection expression for the domain name |
| <a name="output_api_domain_name_arn"></a> [api\_domain\_name\_arn](#output\_api\_domain\_name\_arn) | The ARN of the domain name |
| <a name="output_api_domain_name_configuration"></a> [api\_domain\_name\_configuration](#output\_api\_domain\_name\_configuration) | The domain name configuration |
| <a name="output_api_domain_name_hosted_zone_id"></a> [api\_domain\_name\_hosted\_zone\_id](#output\_api\_domain\_name\_hosted\_zone\_id) | The Amazon Route 53 Hosted Zone ID of the endpoint |
| <a name="output_api_domain_name_id"></a> [api\_domain\_name\_id](#output\_api\_domain\_name\_id) | The domain name identifier |
| <a name="output_api_domain_name_target_domain_name"></a> [api\_domain\_name\_target\_domain\_name](#output\_api\_domain\_name\_target\_domain\_name) | The target domain name |
| <a name="output_api_endpoint"></a> [api\_endpoint](#output\_api\_endpoint) | URI of the API, of the form `https://{api-id}.execute-api.{region}.amazonaws.com` |
| <a name="output_api_execution_arn"></a> [api\_execution\_arn](#output\_api\_execution\_arn) | The ARN prefix to be used in an `aws_lambda_permission`'s `source_arn` attribute or in an `aws_iam_policy` to authorize access to the `@connections` API |
| <a name="output_api_id"></a> [api\_id](#output\_api\_id) | The API identifier |
| <a name="output_api_integrations"></a> [api\_integrations](#output\_api\_integrations) | Map of the integrations created and their attributes |
| <a name="output_api_routes"></a> [api\_routes](#output\_api\_routes) | Map of the routes created and their attributes |
| <a name="output_api_stage_access_logs_cloudwatch_log_group_arn"></a> [api\_stage\_access\_logs\_cloudwatch\_log\_group\_arn](#output\_api\_stage\_access\_logs\_cloudwatch\_log\_group\_arn) | Arn of cloudwatch log group created |
| <a name="output_api_stage_access_logs_cloudwatch_log_group_name"></a> [api\_stage\_access\_logs\_cloudwatch\_log\_group\_name](#output\_api\_stage\_access\_logs\_cloudwatch\_log\_group\_name) | Name of cloudwatch log group created |
| <a name="output_api_stage_arn"></a> [api\_stage\_arn](#output\_api\_stage\_arn) | The stage ARN |
| <a name="output_api_stage_execution_arn"></a> [api\_stage\_execution\_arn](#output\_api\_stage\_execution\_arn) | The ARN prefix to be used in an aws\_lambda\_permission's source\_arn attribute or in an aws\_iam\_policy to authorize access to the @connections API |
| <a name="output_api_stage_id"></a> [api\_stage\_id](#output\_api\_stage\_id) | The stage identifier |
| <a name="output_api_stage_invoke_url"></a> [api\_stage\_invoke\_url](#output\_api\_stage\_invoke\_url) | The URL to invoke the API pointing to the stage |
| <a name="output_api_vpc_links"></a> [api\_vpc\_links](#output\_api\_vpc\_links) | Map of VPC links created and their attributes |
| <a name="output_lambda_function_arn"></a> [lambda\_function\_arn](#output\_lambda\_function\_arn) | The ARN of the Lambda Function |
| <a name="output_lambda_function_name"></a> [lambda\_function\_name](#output\_lambda\_function\_name) | The name of the Lambda Function |
| <a name="output_lambda_function_qualified_arn"></a> [lambda\_function\_qualified\_arn](#output\_lambda\_function\_qualified\_arn) | The ARN identifying your Lambda Function Version |
| <a name="output_lambda_role_arn"></a> [lambda\_role\_arn](#output\_lambda\_role\_arn) | The ARN of the IAM role created for the Lambda Function |
| <a name="output_lambda_role_name"></a> [lambda\_role\_name](#output\_lambda\_role\_name) | The name of the IAM role created for the Lambda Function |
| <a name="output_lambda_role_unique_id"></a> [lambda\_role\_unique\_id](#output\_lambda\_role\_unique\_id) | The unique id of the IAM role created for the Lambda Function |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License

Apache-2.0 Licensed. See [LICENSE](https://github.com/clowdhaus/terraform-aws-ecr-endpoint/blob/main/LICENSE).

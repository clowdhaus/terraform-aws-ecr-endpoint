# Complete Amazon ECR Endpoint Example

Configuration in this directory creates:

- <XXX>

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which will incur monetary charges on your AWS bill. Run `terraform destroy` when you no longer need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.37 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ecr_endpoint"></a> [ecr\_endpoint](#module\_ecr\_endpoint) | ../.. | n/a |
| <a name="module_ecr_endpoint_disabled"></a> [ecr\_endpoint\_disabled](#module\_ecr\_endpoint\_disabled) | ../.. | n/a |

## Resources

No resources.

## Inputs

No inputs.

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
| <a name="output_api_endpoint"></a> [api\_endpoint](#output\_api\_endpoint) | URI of the API, of the form `https://{api-id}.execute-api.{region}.amazonaws.com` for HTTP APIs and `wss://{api-id}.execute-api.{region}.amazonaws.com` for WebSocket APIs |
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
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

Apache-2.0 Licensed. See [LICENSE](https://github.com/clowdhaus/terraform-aws-ecr-endpoint/blob/main/LICENSE).

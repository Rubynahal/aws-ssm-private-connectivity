# aws-ssm-private-connectivity
This module sets up the necessary components to allow you to connect to session manager when there is no internet connectivity on the VPC.


## Examples


### Simple Example
Here is an example of how you can use this module in your inventory structure:
```hcl
  module "ssm_endpoints" {
    source      = "../aws-ssm-private-connectivity"
    version     = "0.15.0"
    prefix      = "staging"
    vpc_id      = module.vpc.vpc_id
    vpc_cidr    = var.vpc_cidr
    tags        = var.tags
  }

```


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| prefix | Prefix to use for security group name | `string` | `""` | yes |
| vpc\_id | id of the vpc | `string` | `""` | yes |
| vpc\_cidr | CIDR of the vpc for ingress rule for security group | `string` | `"10.0.0.0/8"` | no |
| private\_dns\_enabled | Whether you want to enable private DNS for the endpoints | `bool` | `false` | no |
| ssm\_endpoints | ssm endpoints service names | `list(any)` | `["com.amazonaws.us-east-1.ssm", "com.amazonaws.us-east-1.ssmmessages", "com.amazonaws.us-east-1.ec2messages"]` | no |
| tags | Additional tags (e.g. map(`BusinessUnit`,`XYZ`). | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| ssm\_security\_group\_id | Id of the sercurity group |



## Authors

This module was created by Ruby Nahal.




variable "prefix" {
    description = "prefix to use for naming resources"
    default = null
    type = string
}

variable "vpc_id" {
    description = "ID of the vpc"
    default = null
    type = string
}

variable "vpc_cidr" {
    description = "CIDR of the vpc"
    default = null
    type = string
}

variable "private_dns_enabled" {
    description = "whether private DNS is enabled"
    default = false
    type = bool
}


variable "ssm_endpoints" {
  description = "SSM Endpoint Service Names"
  type        = list(any)
  default     = ["com.amazonaws.us-east-1.ssm", "com.amazonaws.us-east-1.ssmmessages", "com.amazonaws.us-east-1.ec2messages"]
}

variable "tags" {
  default     = {}
  description = "Tags to add to supported resources"
  type        = map(string)
}

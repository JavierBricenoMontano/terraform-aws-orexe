variable "virginia_cidr" {
  description = "CIDR block for the Virginia VPC"
  type        = string
}

variable "subnets" {
  description = "List of subnets"
  type        = list(string)
}

variable "tags" {
  description = "Tags for the resources"
  type        = map(string)
}

variable "sg_ingress_cidr" {
  description = "CIDR block for the security group ingress"
  type        = string
}

# variable "access_key" {
#   description = "AWS access key"
#   type        = string
# }

# variable "secret_key" {
#   description = "AWS access key"
#   type        = string
# }

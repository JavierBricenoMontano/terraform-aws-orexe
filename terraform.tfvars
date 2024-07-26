virginia_cidr = "10.10.0.0/16"
subnets       = ["10.10.0.0/24", "10.10.1.0/24"]
tags = {
  "env"         = "dev"
  "owner"       = "JavierBM"
  "cloud"       = "AWS"
  "IAC"         = "TerraformJBM"
  "IAC_version" = "1.18.0"
}

sg_ingress_cidr = "0.0.0.0/0"

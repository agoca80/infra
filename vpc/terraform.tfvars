azs                = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
cidr               = "10.1.0.0/16"
enable_nat_gateway = false
enable_vpn_gateway = false
environment        = "dev"
name               = "dev"

private_subnets = ["10.1.100.0/24", "10.1.101.0/24", "10.1.102.0/24"]

private_subnet_tags = {
  Private = "true"
}

public_subnets = ["10.1.200.0/24", "10.1.201.0/24", "10.1.202.0/24"]

public_subnets_tags = {
  Public = "true"
}

tags = {
  Config      = "vpc"
  Environment = "dev"
}

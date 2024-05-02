variable "azs" {
  type = list(string)
}

variable "enable_nat_gateway" {
  type = bool
}

variable "enable_vpn_gateway" {
  type = bool
}

variable "environment" {
  type = string
}

variable "cidr" {
  type = string
}

variable "name" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}

variable "private_subnet_tags" {
  type = map(string)
}

variable "public_subnets" {
  type = list(string)
}

variable "public_subnets_tags" {
  type = map(string)
}

variable "tags" {
  type = map(string)
}

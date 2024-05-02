availability_zones = [
  "eu-west-1a",
  "eu-west-1b",
  "eu-west-1c",
]

environment = "dev"

name = "ingress"

listeners = {
  foundry = 30000
}

tags = {
  Config      = "ingress"
  Environment = "dev"
  Name        = "ingress"
}

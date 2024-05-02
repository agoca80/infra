tags = {
  Config = "ebs"
}

volumes = {
  foundry = {
    availability_zone = "eu-west-1a"
    final_snapshot    = true
    size              = 20
    type              = "gp3"
  }
}

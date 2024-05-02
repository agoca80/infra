variable "volumes" {
  type = map(object({
    availability_zone = string
    size              = number
    type              = string
  }))
}

variable "tags" {
  type = map(string)
}

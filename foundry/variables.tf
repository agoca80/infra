variable "config" {
  type = object({
    deploy  = bool
    version = string
    world   = string
  })
}

variable "environment" {
  type = string
}

variable "name" {
  type = string
}

variable "tags" {
  type = map(string)
}

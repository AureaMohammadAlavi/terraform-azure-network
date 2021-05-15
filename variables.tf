variable "resource_group_name" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "address_space" {
  type = string
  default = "192.168.0.0/16"
}

variable "subnets" {
  type = map(object({
    number = number
  }))
}



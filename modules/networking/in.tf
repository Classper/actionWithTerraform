variable "group" {
    type = string
}

variable "location" {
    type=string
}

variable "address_space" {
    type=list(string)
}

variable "mysubnet" {
    type=list(object({
        name = string
        address_prefix = string
  }))
}

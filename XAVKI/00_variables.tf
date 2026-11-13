variable "network_external_id" {
  type    = string
  default = "34a684b8-2889-4950-b08e-c33b3954a307" # networks / ext-floating1 > ID
}

variable "network_internal_dev" {
  type    = string
  default = "internal_dev"
}

variable "network_subnet_cidr" {
  type    = string
  default = "10.0.1.10/24"
}

variable "ssh_public_key_default_user" {
  type    = string
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOcWKadJefNSH+TQUHgEl8VLrxbmbJVoWVoO5Je8V/B4 etienne-lab"
}

variable "instance_image_id" {
  type = string
  # default = "cdf81c97-4873-473b-b0a3-f407ce837255"
  default = "feb9837a-29fa-46db-9b26-05bc2800f3c2"
}

variable "instance_flavor_name" {
  type    = string
  default = "a1-ram2-disk20-perf1"
}

variable "instance_security_groups" {
  type    = list(any)
  default = ["default"]
}

variable "metadatas" {
  type = map(string)
  default = {
    "environment" = "dev"
  }
}

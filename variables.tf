variable "cidr_block" {}

variable "subnets" {}
variable "env" {}
variable "tags" {}
variable "az" {
  default = ["us-east-1a", "us-east-1b"]
}

variable "default_vpc_id" {}

variable "subnet_id" {}

variable "vpc_id" {}
resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  enable_dns_support = true

 tags =  merge({
   Name = "${var.env}-vpc"
}, var.tags)


}

module "subnet" {
  source = "./subnets"
  vpc_id = aws_vpc.main.id
  for_each = var.subnets
  cidr_block = each.value["cider_block"]
  subnet_name= each.key
  env = var.env
  tags = var.tags

}
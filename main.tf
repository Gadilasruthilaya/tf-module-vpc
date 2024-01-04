resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  enable_dns_support = true

 tags =  merge({
   Name = "${var.env}-vpc"
}, var.tags)


}

module "subnets" {
  source = "./subnets"
  vpc_id = aws_vpc.main.id
  for_each = var.subnets
  cidr_block = each.value["cidr_block"]
  subnet_name= each.key
  env = var.env
  tags = var.tags
  az = var.az

}


resource "aws_vpc_peering_connection" "foo" {
  peer_vpc_id   = aws_vpc.main.id
  vpc_id        = var.default_vpc_id
  auto_accept = true
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.env}"
  }
}
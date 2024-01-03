resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  enable_dns_support = true

 tags =  merge({
   Name = "${var.env}-vpc"
}, var.tags)


}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.web_subnet_cidr_block

  tags =  merge({Name = "${var.env}-subnet-web"}, var.tags)


}
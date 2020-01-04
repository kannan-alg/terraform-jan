resource "aws_vpc" "myvpc" {
  cidr_block           = "${var.vpc_cidir}"
  enable_dns_hostnames = true
  tags = {
    Name = "${var.vpc_name}"
  }
}

resource "aws_subnet" "subnets" {
  count             = "${length(var.subnet_cidrs)}"
  cidr_block        = "${element(var.subnet_cidrs, count.index)}"
  availability_zone = "${element(var.azs, count.index)}"
  vpc_id            = "${aws_vpc.myvpc.id}"
  tags = {
    Name = "${var.subnet_name}-${count.index + 1}"
  }
}

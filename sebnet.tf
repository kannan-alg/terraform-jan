resource "aws_subnet" "public_subnets" {
  count                   = "${length(var.public_subnet_cidrs)}"
  cidr_block              = "${element(var.public_subnet_cidrs, count.index)}"
  availability_zone       = "${element(var.azs, count.index)}"
  vpc_id                  = "${aws_vpc.myvpc.id}"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.public_subnet_name}-${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnets" {
  count             = "${length(var.private_subnet_cidrs)}"
  cidr_block        = "${element(var.private_subnet_cidrs, count.index)}"
  availability_zone = "${element(var.azs, count.index)}"
  vpc_id            = "${aws_vpc.myvpc.id}"
  tags = {
    Name = "${var.private_subnet_name}-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.myvpc.id}"

  tags = {
    Name = "${var.vpc_name}-IGW"
  }
}


resource "aws_route_table" "public_rt" {
  vpc_id = "${aws_vpc.myvpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }
  tags = {
    Name = "${var.vpc_name}-Public-RT"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = "${aws_vpc.myvpc.id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.nat.id}"
  }
  tags = {
    Name = "${var.vpc_name}-Private-RT"
  }
}

resource "aws_route_table_association" "public_association" {
  count          = "${length(var.public_subnet_cidrs)}"
  subnet_id      = "${aws_subnet.public_subnets.*.id[count.index]}"
  route_table_id = "${aws_route_table.public_rt.id}"
}

resource "aws_route_table_association" "private_association" {
  count          = "${length(var.private_subnet_cidrs)}"
  subnet_id      = "${aws_subnet.private_subnets.*.id[count.index]}"
  route_table_id = "${aws_route_table.private_rt.id}"
}

resource "aws_eip" "eip" {
  vpc = true
  tags = {
    Name = "${var.vpc_name}-NAT-EIP"
  }
}


resource "aws_nat_gateway" "nat" {
  allocation_id = "${aws_eip.eip.id}"
  subnet_id     = "${aws_subnet.public_subnets.*.id[0]}"

  tags = {
    Name = "${var.vpc_name}-NAT"
  }
}

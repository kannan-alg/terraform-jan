resource "aws_instance" "public_instance" {
  count                       = "${var.public_instance_count}"
  ami                         = "${lookup(var.ami_id, var.region)}"
  instance_type               = "${var.instance_type}"
  subnet_id                   = "${aws_subnet.public_subnets.*.id[count.index]}"
  vpc_security_group_ids      = ["${aws_security_group.allow_ssh_http.id}"]
  key_name                    = "${var.key_name}"
  user_data                   = "${file("scripts/user_data.sh")}"
  associate_public_ip_address = true
  tags = {
    Name = "${var.vpc_name}-Public-Instance-${count.index + 1}"
  }
}


resource "aws_instance" "private_instance" {
  count                  = "${var.private_instance_count}"
  ami                    = "${lookup(var.ami_id, var.region)}"
  instance_type          = "${var.instance_type}"
  subnet_id              = "${aws_subnet.private_subnets.*.id[count.index]}"
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
  key_name               = "${var.key_name}"
  user_data              = "${file("scripts/user_data.sh")}"

  tags = {
    Name = "${var.vpc_name}-Private-Instance-${count.index + 1}"
  }
}

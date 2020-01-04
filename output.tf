output "Public_Instance_Public_IP" {
  value = "${aws_instance.public_instance.*.public_ip}"
}

output "Private_Instance_Private_IP" {
  value = "${aws_instance.private_instance.*.private_ip}"
}

output "vpc_id" {
  value = "${aws_vpc.myvpc.id}"
}

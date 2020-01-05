# resource "aws_iam_role" "test_role" {
#   name = "instance_role"
#
#   assume_role_policy = "${file("policies/assume_role_policy.json")}"
#
#   tags = {
#     Name = "instance_role"
#   }
# }
#
#
#
# resource "aws_iam_policy" "policy" {
#   name        = "instance_policy"
#   path        = "/"
#   description = "My test policy"
#
#   policy = "${file("policies/instance_policy.json")}"
# }
#
# resource "aws_iam_policy_attachment" "instance_attachment" {
#   name       = "instance_attachment"
#   roles      = ["${aws_iam_role.test_role.name}", ]
#   policy_arn = "${aws_iam_policy.policy.arn}"
# }
#
#
#
#
# resource "aws_iam_instance_profile" "test_profile" {
#   name = "test_profile"
#   role = "${aws_iam_role.test_role.name}"
# }
#
#
# resource "aws_instance" "web" {
#   ami                  = "ami-00eb20669e0990cb4"
#   instance_type        = "t2.micro"
#   iam_instance_profile = "${aws_iam_instance_profile.test_profile.name}"
#
#   tags = {
#     Name = "HelloWorld"
#   }
# }

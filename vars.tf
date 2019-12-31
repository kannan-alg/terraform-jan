variable "vpc_cidir" {
  default = "10.0.0.0/16"
}
variable "vpc_name" {
  default = "MyVPC"
}
variable "region" {
  default = "us-east-1"
}

variable "subnet_cidrs" {
  type    = "list"
  default = ["10.0.0.0/25", "10.0.1.0/25", "10.0.2.0/25", "10.0.3.0/25"]
}

variable "azs" {
  type    = "list"
  default = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d"]
}
variable "subnet_name" {
  default = "Subnet"
}

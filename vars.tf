variable "vpc_cidir" {
  default = "10.0.0.0/16"
}
variable "vpc_name" {
  default = "MyVPC"
}
variable "region" {
  type    = "string"
  default = "us-east-1"
}

variable "public_subnet_cidrs" {
  type    = "list"
  default = ["10.0.0.0/25", "10.0.1.0/25"]
}

variable "private_subnet_cidrs" {
  type    = "list"
  default = ["10.0.2.0/25", "10.0.3.0/25"]
}
variable "azs" {
  type    = "list"
  default = ["us-east-1a", "us-east-1b"]
}
variable "public_subnet_name" {
  default = "Public_Subnet"
}

variable "private_subnet_name" {
  default = "Private_Subnet"
}


variable "instance_type" {
  default = "t2.micro"
}


variable "public_instance_count" {
  default = "1"
}

variable "private_instance_count" {
  default = "1"
}


variable "key_name" {
  default = "new"
}

variable "ami_id" {
  type = "map"
  default = {
    us-east-1 = "ami-00eb20669e0990cb4"
    us-west-2 = "ami-08d489468314a58df"
    us-east-2 = "ami-03b4aa59bf41f9ed4"
  }
}

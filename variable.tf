variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {}
variable "AMIS" {
	type = "map"
	default = {
	  ap-south-1 = "ami-04b2519c83e2a7ea5"
	  us-east-1 = "ami-0915e09cc7ceee3ab"
	}
}

variable "VPCS" {
	type = "map"
	default = {
	  ap-south-1 = "vpc-da9098b2"
	  us-east-1 = "vpc-9288bbe8"
	}
}
variable "size"{
}
variable "instance_type" {
}
variable "INSTANCE_USERNAME"{
	default = "ec2-user"
}
variable "PATH_TO_PRIVATE_KEY" {
	default = "mykey"
}
variable "PATH_TO_PUBLIC_KEY" {
	default = "mykey.pub"
}

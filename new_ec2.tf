provider "aws" {
	region = "us-east-1"
}
resource "aws_instance" "myos_new" {
	ami = "ami-09d069a04349dc3cb"
	instance_type = "t2.micro"
        iam_instance_profile = "${aws_iam_instance_profile.test_profile.name}"
	vpc_security_group_ids = ["sg-0c1ef98d1c91b2637"] 
	root_block_device  {
        volume_size = "10"
}
	tags = {
	 Name = "atharva_role"
}
	key_name = "aws_key"
}


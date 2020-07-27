resource "aws_key_pair" "mykey" {
	key_name = "mykey"
	public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}
resource "aws_instance" "vm" {
	ami = "${lookup(var.AMIS, var.AWS_REGION)}"
	instance_type = "${var.instance_type}"
	iam_instance_profile = "${aws_iam_instance_profile.test_profile.name}"
	vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
	root_block_device {
	volume_size = "${var.size}"
	}
	tags = {
	  Name = "new_aws_instance"
	}
	key_name = "${aws_key_pair.mykey.key_name}"

	provisioner "file" {
		source = "script2.sh"
		destination="/tmp/script2.sh"
	}
	provisioner "remote-exec" {
	  inline = [
	    "chmod +x /tmp/script2.sh",
	    "sudo sed -i -e 's/\r$//' /tmp/script2.sh",
	    "sudo /tmp/script2.sh"
	  ]
	}
	connection {
	  host = coalesce(self.public_ip, self.private_ip)
          	  type = "ssh"
	  user = "${var.INSTANCE_USERNAME}"
	  private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
	}

}

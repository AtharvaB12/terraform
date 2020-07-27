resource "aws_iam_instance_profile" "test_profile" {
	name = "test_profile1"
	role = "${aws_iam_role.test_role.name}"
}

resource "aws_iam_role_policy" "ec2_admin_policy" {
  name = "ec2_admin_policy"
  role = "${aws_iam_role.test_role.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
      }
    ]
}
EOF
}
  

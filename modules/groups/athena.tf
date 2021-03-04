# Create the group
resource "aws_iam_group" "athena_group" {
  name = "athena-group"
}

resource "aws_iam_group_membership" "athena_group_membership" {
  name = "athena-group"
  group = aws_iam_group.athena_group.name
  users = var.athena_users
}

resource "aws_iam_group_policy_attachment" "attach_athena_policy" {
  group = aws_iam_group.athena_group.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonAthenaFullAccess"
}


resource "aws_iam_group_policy" "read_athena_data_buckets" {
  name = "read_athena_data_buckets_policy"
  group = aws_iam_group.athena_group.name
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:Get*",
        "s3:List*"
      ],
      "Resource": [
        "arn:aws:s3:::douglasnaphasalbcreate-a-albaccesslogbucket9abe2c-10x8rlu9ujiaq*",
        "arn:aws:s3:::passover-lol-alb-access-logs-bucket-2*"
      ]
    }
  ]
}
EOF
}


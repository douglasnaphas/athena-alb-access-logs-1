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


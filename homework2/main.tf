
resource "aws_iam_user" "new-users" {
  for_each = toset([
    "jenny",
    "rose",
    "lisa",
    "jisoo"
  ])
  name = each.key
}

resource "aws_iam_group" "hw-group" {
  name = "blackpink"
}

resource "aws_iam_group_membership" "team" {
  name = "group-membership"

  users = [
    for i in aws_iam_user.new-users : i.name
  ]

  group = aws_iam_group.hw-group.name
}
 
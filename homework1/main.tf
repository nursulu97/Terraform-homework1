
provider "aws" {
  region = "us-east-1" 
}

resource "aws_iam_user" "jenny" {
  name = "jenny"
}

resource "aws_iam_user" "rose" {
  name = "rose"
}

resource "aws_iam_user" "lisa" {
  name = "lisa"
}

resource "aws_iam_user" "jisoo" {
  name = "jisoo"
}

resource "aws_iam_user" "jihyo" {
  name = "jihyo"
}

resource "aws_iam_user" "sana" {
  name = "sana"
}

resource "aws_iam_user" "momo" {
  name = "momo"
}

resource "aws_iam_user" "dahyun" {
  name = "dahyun"
}

resource "aws_iam_group" "blackpink" {
  name = "blackpink"
}

resource "aws_iam_group" "twice" {
  name = "twice"
}

# Add users to groups
resource "aws_iam_group_membership" "blackpink_members" {
  name   = "blackpink-membership"
  group  = aws_iam_group.blackpink.name
  users = [
    aws_iam_user.jenny.name,
    aws_iam_user.rose.name,
    aws_iam_user.lisa.name,
    aws_iam_user.jisoo.name,
  ]
}

resource "aws_iam_group_membership" "twice_members" {
  name   = "twice-membership"
  group  = aws_iam_group.twice.name
  users = [
    aws_iam_user.jihyo.name,
    aws_iam_user.sana.name,
    aws_iam_user.momo.name,
    aws_iam_user.dahyun.name,
  ]
}
# Created two users manually in AWS Console (attach 0 policies): miyeon and mina
resource "aws_iam_user" "mina" {
  name = "mina"
}

resource "aws_iam_user" "miyeon" {
  name = "miyeon"
}
resource "aws_iam_group_membership" "bl" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.mina.name,
  ]

  group = aws_iam_group.blackpink.name
}

resource "aws_iam_group_membership" "tw" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.miyeon.name,
  ]

  group = aws_iam_group.twice.name
}
#terraform init
# terraform import aws_iam_user.miyeon miyeon
# terraform import aws_iam_user.mina mina
#terraform apply --auto-approve

# terraform destroy to confirm you can delete all resources

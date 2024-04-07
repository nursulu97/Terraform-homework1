
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


#terraform init
#terraform apply
resource "aws_iam_user" "mina" {
  name = "mina"
}

resource "aws_iam_user" "miyeon" {
  name = "miyeon"
}
# terraform import aws_iam_user.miyeon miyeon
# terraform import aws_iam_user.mina mina

# terraform destroy to confirm you can delete all resources
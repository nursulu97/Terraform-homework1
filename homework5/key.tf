resource "aws_key_pair" "hw3" {
  key_name   = var.key_pair
  public_key = file("~/.ssh/id_rsa.pub")
}
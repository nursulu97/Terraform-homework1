resource "aws_key_pair" "hw3" {
  key_name   = "bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")
}
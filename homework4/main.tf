# #Create EC2 instance

resource "aws_instance" "Nursulu" {
  count             = var.counts
  ami               = var.ami_id
  instance_type     = var.instance_type
  availability_zone = var.availability_zone
  key_name          = aws_key_pair.example_keypair.key_name
  security_groups   = [aws_security_group.example_security_group.name]
  tags = {
    Name = "Nursulu"
  }
}

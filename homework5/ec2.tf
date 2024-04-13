# Launch EC2 Instances
resource "aws_instance" "ubuntu_instance" {
  count           = length(var.ec2_instances)
  ami             = var.ec2_instances[count.index].ami
  instance_type   = var.ec2_instances[count.index].instance_type
   subnet_id              = aws_subnet.public1.id 
  security_groups = [aws_security_group.kaizen_sg.id]
  key_name        = var.key_name
  user_data       = file("ubuntu_apache.sh")
  user_data_replace_on_change = true 

  tags = {
    Name = var.ec2_instances[count.index].name
  }
}

resource "aws_instance" "amazon_instance" {
  count           = length(var.ec2_instances)
  ami             = var.ec2_instances[count.index].ami
  instance_type   = var.ec2_instances[count.index].instance_type
   subnet_id              = aws_subnet.public2.id 
  security_groups = [aws_security_group.kaizen_sg.id]
  key_name        = var.key_name
  user_data       = file("linux_apache.sh")
  user_data_replace_on_change = true 

  tags = {
    Name = var.ec2_instances[count.index].name
  }
}

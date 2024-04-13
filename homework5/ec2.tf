# Launch EC2 Instances
resource "aws_instance" "ubuntu" {
  ami                    = var.ami_ubuntu
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public1.id 
  vpc_security_group_ids =[aws_security_group.kaizen_sg.id]
  key_name               = var.key_pair
 user_data = file("ubuntu_apache.sh")
  user_data_replace_on_change = true 

  tags = {
    Name = "Ubuntu"
  }
  
}

resource "aws_instance" "amazon" {
  ami                    = var.ami_amazon_linux
  instance_type          = "t2.micro"
  subnet_id = aws_subnet.public2.id
  vpc_security_group_ids = [aws_security_group.kaizen_sg.id]
  key_name               = var.key_pair
  user_data = file("linux_apache.sh")
  user_data_replace_on_change = true 

  tags = {
    Name = "Amazon"
  }
  
}
output "ubuntu_public_dns" {
  value = aws_instance.ubuntu.public_dns
}

output "ubuntu_public_ip" {
  value = aws_instance.ubuntu.public_ip
}
# Create Security Group
resource "aws_security_group" "kaizen_sg" {
  vpc_id = aws_vpc.kaizen.id

 #Allow SSH (port 22) and HTTP (port 80) traffic
  ingress {
    from_port   = var.open_ports[0]
    to_port     = var.open_ports[0]
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = var.open_ports[1]
    to_port     = var.open_ports[1]
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

#Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "kaizen_sg"
  }
} 
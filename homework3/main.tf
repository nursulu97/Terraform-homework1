provider aws {
    region = "us-east-2"
}

data "aws_ami" "amazon-linux-2" {
 most_recent = true


 filter {
   name   = "owner-alias"
   values = ["amazon"]
 }


 filter {
   name   = "name"
   values = ["amzn2-ami-hvm*"]
 }
}
# Data source to get all availability zones in the region
data "aws_availability_zones" "all" {}


resource "aws_instance" "web" {
  count         = 3 
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = "t2.micro"
  availability_zone      = element(data.aws_availability_zones.all.names, count.index)
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  key_name = aws_key_pair.hw3.bastion-key
 
  user_data = file("apache.sh")
  user_data_replace_on_change = true 


  tags = {
    Name = "web-${count.index + 1}"
  }
}




output ec2 {
  value = aws_instance.web[*].public_ip
}
# we can copy the public ip from outputs and check the running of apache 
#terraform init
#terraform apply --auto-approve 
#created 3 instances web-1, web-2,web-3 in three different availability zones
# running of apache was succesful, it shows "Hello World"
#after work destroyed everything
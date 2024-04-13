provider "aws" {
  region = var.region
}
# Create VPC
resource "aws_vpc" "kaizen" {
  cidr_block       = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "kaizen"
  }
}
# Create Internet Gateway
resource "aws_internet_gateway" "homework5_igw" {
  vpc_id = aws_vpc.kaizen.id

  tags = {
    Name = "homework5_igw"
  }
}
# Create Subnets
# Create Subnet for public1
resource "aws_subnet" "public1" {
  vpc_id            = aws_vpc.kaizen.id
  cidr_block        = var.subnets[0].cidr_block
   map_public_ip_on_launch = true
  availability_zone = var.subnets[0].availability_zone

  tags = {
    Name = var.subnets[0].name
  }
}

# Create Subnet for public2
resource "aws_subnet" "public2" {
  vpc_id            = aws_vpc.kaizen.id
  cidr_block        = var.subnets[1].cidr_block
   map_public_ip_on_launch = true
  availability_zone = var.subnets[1].availability_zone

  tags = {
    Name = var.subnets[1].name
  }
}

# Create Subnet for private1
resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.kaizen.id
  cidr_block        = var.subnets[2].cidr_block
   map_public_ip_on_launch = true
  availability_zone = var.subnets[2].availability_zone

  tags = {
    Name = var.subnets[2].name
  }
}

# Create Subnet for private2
resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.kaizen.id
  cidr_block        = var.subnets[3].cidr_block
   map_public_ip_on_launch = true
  availability_zone = var.subnets[3].availability_zone

  tags = {
    Name = var.subnets[3].name
  }
}



# Create Route Table for Public Subnets
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.kaizen.id

  tags = {
    Name = "public-rt"
  }
}

# Create Route Table for Private Subnets
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.kaizen.id

  tags = {
    Name = "private-rt"
  }
}

# Create Route for Public Subnets to Internet Gateway
resource "aws_route" "public_subnet_route" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.homework5_igw.id

  depends_on = [aws_internet_gateway.homework5_igw]
}

# Associate Subnets with Route Tables
# Create Route Table Association for public1 subnet
resource "aws_route_table_association" "public1_association" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public_rt.id
}

# Create Route Table Association for public2 subnet
resource "aws_route_table_association" "public2_association" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public_rt.id
}

# Create Route Table Association for private1 subnet
resource "aws_route_table_association" "private1_association" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private_rt.id
}

# Create Route Table Association for private2 subnet
resource "aws_route_table_association" "private2_association" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private_rt.id
}
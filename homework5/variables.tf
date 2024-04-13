variable "region" {
  description = "AWS region"
  default     = "us-west-2"
}
variable "key_pair" {
  description = "Name of key for EC2 instances"
  default     = "bastion-key"
}

variable "ami_ubuntu" {
  description = "AMI ID for the latest Ubuntu image"
  default     = "ami-08116b9957a259459"
}

variable "ami_amazon_linux" {
  description = "AMI ID for the latest Amazon Linux image"
  default     = "ami-0395649fbe870727e"
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "subnets" {
  description = "List of subnets"
  type = list(object({
    name             = string
    cidr_block       = string
    availability_zone = string
  }))
  default = [
    {
      name             = "public1"
      cidr_block       = "10.0.1.0/24" 
      availability_zone = "us-west-2a"
    },
    {
      name             = "public2"
      cidr_block       = "10.0.2.0/24"  
      availability_zone = "us-west-2b"
    },
    {
      name             = "private1"
      cidr_block       = "10.0.3.0/24"  
      availability_zone = "us-west-2c"
    },
    {
      name             = "private2"
      cidr_block       = "10.0.4.0/24"  
      availability_zone = "us-west-2d"
    }
  ]
}



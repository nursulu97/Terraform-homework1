# Define variables
variable "region" {
  description = "AWS region"
  default     = ""
  type        = string
}

variable "key_name" {
  description = "Name of the key pair"
  default     = ""
  type        = string
}

variable "ports" {
  description = "List of ports"
  type        = list(number)
}

variable "availability_zone" {
  description = "Availability zone for the EC2 instance"
  type        = string

}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  default           = "ami-0900fe555666598a2"
  type = string
}

variable "counts" {
  description = "Number of EC2 instances to create"

}
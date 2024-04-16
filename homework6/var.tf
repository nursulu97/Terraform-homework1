variable "region" {
  type        = string
  description = "Select your region"
}

variable "instance_type" {
  type        = string
  description = "Provide instance type"

}
variable "key_name" {
  description = "Name of the key pair"
  default     = "Bastion-key"
  type        = string
}

# Created 4 tfvars files for 4 US regions and provided variables for reagion an key
# Use workspace to create instance in all 4 regions.

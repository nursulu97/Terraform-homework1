# Terraform-homework1
i created 4 different .tfvars for 4 deffirent regions 
# For example this for ohio
region            = "us-east-2"
key_name          = "Bastion-key"
ports             = [22, 80, 443]
availability_zone = "us-east-2b"
instance_type     = "t2.micro"
ami_id            = "ami-0900fe555666598a2"
counts            = 1 
# And in command line typed 
#terraform apply -var-file="ohio.tfvars"
# in other regions we just changed variables for region, ami_id and availability zones
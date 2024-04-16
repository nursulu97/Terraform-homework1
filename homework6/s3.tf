terraform {
  backend "s3" {
    bucket = "nursulu-bucket"
    key    = "statefiles/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "nursulu-lock"
  }
}


# Created manually S3 bucket  'nursulu-bucket' to send and keep the  state files
# or we can create s3 bucket with terraform

# resource "aws_s3_bucket" "terraform_state_bucket" {
#     bucket = "nursulu-bucket"
#     versioning {
#       enabled = true
# }
#}
# Created a DynamoDb  table named 'nursulu-lock' and with particion key name "LockID'
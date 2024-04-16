terraform {
  backend "s3" {
    bucket = "nursulu-bucket"
    key    = "statefiles/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "nursulu-lock"
  }
}


# Created manually S3 bucket  'nursulu-bucket' to send and keep the  state files
# Created a DynamoDb  table named 'nursulu-lock' and with particion key name "LockID'

resource "aws_s3_bucket" "hw2_s3" {
  bucket = "kaizen-nursulu"
  force_destroy = true
}

resource "aws_s3_bucket" "hw2_s3_1" {
  bucket_prefix = "kaizen-"
  force_destroy = true
}

# importing the S3 buckets created manually in AWS Console to Terraform:
resource "aws_s3_bucket" "hw2_s3_2" {
  bucket_prefix = "kaizen-nurs"
  force_destroy = true
}

resource "aws_s3_bucket" "hw2_s3_3" {
  bucket_prefix = "kaizen-nurs2"
  force_destroy = true
}

# run in terminal to import S3 buckets created manually:
#  terraform import aws_s3_bucket.hw2_s3_2 kaizen-nurs
#  terraform import aws_s3_bucket.hw2_s3_3 kaizen-nurs2
#  terraform apply --auto-approve
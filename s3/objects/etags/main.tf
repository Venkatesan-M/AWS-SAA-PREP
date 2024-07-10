terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.57.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "my_s3_bucket_example" {
    bucket = "remove-name-to-randomise"  # Ensure this is a unique name
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.my_s3_bucket_example.bucket  # Referencing the bucket name from the bucket resource
  key    = "myfile.txt"
  source = "myfile.txt"

  etag = filemd5("myfile.txt")
}

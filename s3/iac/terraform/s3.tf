
resource "aws_s3_bucket" "my-s3-bucket-example" {
  bucket = "remove-name-to-randomise"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
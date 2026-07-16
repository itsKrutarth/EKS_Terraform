

resource "random_string" "randstr" {
  length = 6
  special = false
  upper = false
}

resource "aws_s3_bucket" "backendBucket" {
    bucket = "my-tf-test-first-bucket-${random_string.randstr.result}"

    tags = {
        Name        = "First demo bucket"
        Environment = "Dev"
        Owner = "Krutarth Patel"
    }
}
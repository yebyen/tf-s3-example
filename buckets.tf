resource "aws_s3_bucket" "d" {
  bucket = "${var.sensitive_s3_bucket}"
  acl    = "private"

  tags {
    Name        = "database"
    Environment = "Dev"
    Creator     = "kingdon-terraform"
  }
}
resource "aws_s3_bucket" "b" {
  bucket = "kingdonb-terraform-deis-builder-1"
  acl    = "private"

  tags {
    Name        = "builder"
    Environment = "Dev"
    Creator     = "kingdon-terraform"
  }
}
resource "aws_s3_bucket" "r" {
  bucket = "kingdonb-terraform-deis-registry-1"
  acl    = "private"

  tags {
    Name        = "registry"
    Environment = "Dev"
    Creator     = "kingdon-terraform"
  }
}

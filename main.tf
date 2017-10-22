variable "sensitive_s3_bucket" {
  type = "string"
  default = "kingdonb-terraform-deis-database-1"
}

provider "aws" {}

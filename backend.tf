terraform {
  backend "s3" {
    bucket = "mybucket"
    key    = "bucket/test"
    region = "us-east-1"
  }
}
resource "null_resource" "resource" {}
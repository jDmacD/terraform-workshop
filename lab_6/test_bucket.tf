resource "aws_s3_bucket" "test_bucket" {
  bucket = "tf-test-bucket-${random_uuid.bucket.result}"
  lifecycle { prevent_destroy = false }
  tags = {
    LabName = "6.StoringPersistentStates"
  }
  force_destroy = true
}
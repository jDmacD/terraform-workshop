terraform {
  backend "s3" {
    #key = path/to/my/key
    key = "terraform.tfstate"
    #region = var.region
    region = "us-west-1"
    # ENTRY MUST BE UPDATED !!
    # e.g. bucket = "20201020-student21"
    bucket = "tf-bucket-ad7055ca-3a0e-a648-3de2-ba341ced1cb2"
    #dynamodb_table = var.dynamodb_lock_table_name
    dynamodb_table = "dynamodb-lock"
    encrypt        = true # Optional, S3 Bucket Server Side Encryption
  }
}
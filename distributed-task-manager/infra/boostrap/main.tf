provider "aws" {
    region = var.aws_region
}

resource "aws_s3_bucket" "terraform_state" {
    bucket = var.bucket_name

    versioning {
      enabled = true
    }

    lifecycle {
      prevent_destroy = true
    }

    tags = {
        Name        = "terraform-state"
        Environment = "infra"
    }
}

resource "aws_dynamodb_table" "terraform_lock" {
    name    = var.lock_table_name
    billing_mode = "PAY_PER_REQUEST" 
    hash_key = "LockID"

    attribute {
      name = "LockID"
      type = "S"
    }

    tags = {
      Name      = "terraform-lock"
      Environment = "infra"
    }
}

terraform {
  backend "s3" {
    bucket         = "dtm-terraform-state"
    key            = "vpc/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "dtm-terraform-locks"
    encrypt        = true
  }
}

variable "aws_ragion" {
    description = "AWS region to deploy resources in"
    type        = string
    default     = "us-east-2" 
}

variable "bucket_name" {
    description = "Name of the S3 bucket to store Terraform state"
    type        = string
    default     = "dtm-terraform-state" 
}

variable "lock_table_name" {
    description = "Name of the S3 bucket to store Terraform state"
    type        = string
    default     = "dtm-terraform-state" 
}

variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
}

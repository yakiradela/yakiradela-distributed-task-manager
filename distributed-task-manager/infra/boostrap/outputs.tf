output "s3_bucket_name" {
    description     = "The name of the s3 bucket created for Terraform state"
    value           = aws_s3_bucket.terraform_state.bucket 
}

output "dynamodb_table_name" {
    description     = "the name of the dynamoDB table created for state locking"
    value           =   aws_dynamodb_table.terraform_lock.name
}

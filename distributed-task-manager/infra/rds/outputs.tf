output "db_instance_endpoint" {
    description = "RDS endpoint (hostname)"
    value       = aws_db_instance.postgres.endpoint 
}

output "db_instance_port" {
    description   = "RDS port (default: 5432)"
    value         = aws_db_instance.postgres.port  
}

output "db_name" {
    description  = "Database name"
    value        = aws_db_instance.postgres.name 
}

output "db_username" {
    description = "Database username"
    value       = aws_db_instance.postgres.username
    sensitive = true 
}

output "db_password" {
    description = "Database password"
    value       = aws_db_instance.postgres.password
    sensitive   = true
}

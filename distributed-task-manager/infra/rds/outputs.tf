output "db_instance_endpoint" {
  description = "RDS endpoint (hostname)"
  value       = aws_db_instance.postgres.endpoint
}

output "db_instance_port" {
  description = "RDS port (default: 5432)"
  value       = aws_db_instance.postgres.port
}

output "db_name" {
  description = "Database name"
  value       = aws_db_instance.postgres.db_name  # ✅ זה השם הנכון
}

output "db_username" {
  description = "Database username"
  value       = var.db_username                    # ✅ מגיע מה-variable, לא מהמשאב
  sensitive   = true
}

output "db_password" {
  description = "Database password"
  value       = var.db_password                    # ✅ מגיע מה-variable, לא מהמשאב
  sensitive   = true
}


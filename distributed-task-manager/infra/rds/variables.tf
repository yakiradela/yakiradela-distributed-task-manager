variable "private_subnets" {
  description = "List of private subnet IDs for the RDS subnet group"
  type        = list(string)
}

variable "db_username" {
  description = "Username for the RDS PostgreSQL database"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Password for the RDS PostgreSQL database"
  type        = string
  sensitive   = true
}

variable "security_group_id" {
  description = "Security group ID to attach to the RDS instance"
  type        = string
}

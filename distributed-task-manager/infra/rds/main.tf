resource "aws_db_subnet_group" "rds_subnet_group" {
    name            = "dtm-rds-subnet-group"
    subnet_ids      = var.private_subnets 

    tags = {
      name = "dtm-rds-subnet-group"
    }
}

resource "aws_db_instance" "postgres" {
    identifier             = "dtm-postgres"
    engine                 = "postgres"
    instance_class         = "db.t3.micro"
    allocated_storage      = 20
    name                   = "tasksdb"
    username               = var.db_username 
    password               = var.db_password
    db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name 
    vpc_security_group_ids = [var.security_group_id] 
    skip_final_snapshot    = true 
}


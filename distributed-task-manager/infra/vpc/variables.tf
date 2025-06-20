variable "vpc_name" {
    default = "dtm-vpc"  
}

variable "vpc_cidr" {
    default = "10.0.0.0/16"
}

variable "azs" {
    default = ["us-east-2a", "us-east-2b"] 
}

variable "public_subnets" {
    default = ["10.0.1.0/24" , "10.0.2.0/24"]
}

variable "private_subnets" {
    default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "environment" {
    default = "dev"
}


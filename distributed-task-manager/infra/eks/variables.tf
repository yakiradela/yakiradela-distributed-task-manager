variable "cluster_name" {
    default = "dtm-eks-cluster"
}

variable "cluster_version" {
    default = "1.27"  
}

variable "vpc_id" {}
variable "private_subnets" {
    type = list(string)
}
  
variable "environment" {
    default = "dev"
}  


module "eks" {
    source              = "terraform-aws-modules/eks/aws"
    version             = "19.17.0"

    cluster_name        = var.cluster_name
    cluster_version     = var.cluster_version 

    vpc_id              = var.vpc_id
    subnet_ids          = var.private_subnets

    enable_irsa         = true

    eks_managed_node_groups = {
        default = {
            instance_types  = ["t3.medium"]
            desired_size    = 2
            min_size        = 1
            max_size        = 3
        }
    } 

    tags = {
        environment = var.environment
        terraform   = "true"
    }

}


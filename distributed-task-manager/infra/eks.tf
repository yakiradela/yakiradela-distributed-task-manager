resource "random_id" "kms_suffix" {
  byte_length = 4
}

resource "aws_kms_key" "eks" {
  description             = "KMS key for EKS secrets encryption"
  deletion_window_in_days = 10
  enable_key_rotation      = true
}

resource "aws_kms_alias" "eks" {
  name          = "alias/eks/${var.cluster_name}-${random_id.kms_suffix.hex}"
  target_key_id = aws_kms_key.eks.key_id
}

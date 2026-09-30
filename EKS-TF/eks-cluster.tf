resource "aws_eks_cluster" "eks-cluster" {
  name     = var.cluster-name
  role_arn = aws_iam_role.EKSClusterRole.arn

  access_config {
    authentication_mode = "API_AND_CONFIG_MAP"
  }

  vpc_config {
    subnet_ids         = [
      data.aws_subnet.subnet.id,
      aws_subnet.public-subnet2.id
    ]

    security_group_ids = [
      data.aws_security_group.sg-default.id
    ]
  }

  version = "1.33"

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy
  ]
}

resource "aws_eks_access_entry" "jenkins" {
  cluster_name  = aws_eks_cluster.eks-cluster.name
  principal_arn = "arn:aws:iam::806997204926:role/Jenkins-iam-role"
  type          = "STANDARD"
}

resource "aws_eks_access_policy_association" "jenkins_admin" {
  cluster_name  = aws_eks_cluster.eks-cluster.name
  principal_arn = aws_eks_access_entry.jenkins.principal_arn
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

  access_scope {
    type = "cluster"
  }
}


resource "aws_ec2_tag" "eks_subnet_tag_public_elb" {
  for_each = toset(data.aws_subnets.vpc_pub_subnets_ids.ids)
  resource_id = each.value
  key = "kubernetes.io/role/elb"
  value = "1"
}

resource "aws_ec2_tag" "eks_subnet_tag_public_cluster" {
  for_each = toset(data.aws_subnets.vpc_pub_subnets_ids.ids)
  resource_id = each.value
  key = "kubernetes.ic/cluster/${local.eks_cluster_name}"
  value = "shared"
}

resource "aws_ec2_tag" "eks_subnet_tag_private_elb" {
  for_each = toset(data.aws_subnets.vpc_private_subnets_ids.ids)
  resource_id = each.value
  key = "kubernetes.io/role/internal-elb"
  value = "1"
}

resource "aws_ec2_tag" "eks_subnet_tag_private_cluster" {
  for_each = toset(data.aws_subnets.vpc_private_subnets_ids.ids)
  resource_id = each.value
  key = "kubernetes.ic/cluster/${local.eks_cluster_name}"
  value = "shared"
}

# resource "aws_ec2_tag" "eks_subnet_tag_public_elb" {
#   for_each = toset(data.terraform_remote_state.vpc.outputs.pub_subnets.)
# }
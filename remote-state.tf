data "terraform_remote_state" "vpc" {
    backend = "s3"
    config = {
      bucket = "my-tf-test-first-bucket-hhhhl7"
      key = "vpc/dev/terraform.tfstate"
      region = var.aws_region
    }
}

data "aws_subnets" "vpc_pub_subnets_ids" {
    filter {
    name   = "vpc-id"
    values = [local.vpc_id]
    }

    tags = {
        Tier = "public"
    }
}

data "aws_subnets" "vpc_private_subnets_ids" {
    filter {
    name   = "vpc-id"
    values = [local.vpc_id]
    }

    tags = {
        Tier = "private"
    }
}

output "vpc_id" {
  value = local.vpc_id # data.terraform_remote_state.vpc.outputs.vpc_id
}

output "public_subnet_ids" {
  value = toset(data.aws_subnets.vpc_pub_subnets_ids.ids)
}

output "private_subnet_ids" {
  value = toset(data.aws_subnets.vpc_private_subnets_ids.ids)
}

output "private_subnet" {
  value = data.terraform_remote_state.vpc.outputs.private_subnets
}

output "public_subnet" {
  value = data.terraform_remote_state.vpc.outputs.pub_subnets
}

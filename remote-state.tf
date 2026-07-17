data "terraform_remote_state" "vpc" {
    backend = "s3"
    config = {
      bucket = "my-tf-test-first-bucket-hhhhl7"
      key = "vpc/dev/terraform.tfstate"
      region = var.aws_region
    }
}

output "vpc_id" {
  value = data.terraform_remote_state.vpc.outputs.vpc_id
}

output "private_subnet_ids" {
  value = data.terraform_remote_state.vpc.outputs.private_subnets
}

output "public_subnet_ids" {
  value = data.terraform_remote_state.vpc.outputs.pub_subnets
}

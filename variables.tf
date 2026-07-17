
variable "environment_name" {
  description = "Environment names used in resource and tags"
  type = string
  default = "dev"
}

variable "business_division" {
  description = "Business division in the large org this infra belongs to"
  type = string
  default = "retail"
}

variable "cluster_name" {
  description = "Name of the EKS cluster. Also used as a prefix in related resources"
  type = string
  default = "eks-demo"
}

variable "aws_region" {
  description = "aws region to deploy resources"
  type = string
  default = "us-east-2"
}

variable "cluster_version" {
  description = "Kubernetes minor version to use for the eks cluster"
  type = string
  default = null
}

variable "cluster_service_ipv4_cidr" {
  description = "Service CIDR range for kubernetes services. Optional"
  type = string
  default = null
}

variable "cluster_endpoint_public_access" {
  description = "Whether to enable public access to EKS control plane endpoint"
  type = bool
  default = true
}

variable "cluster_endpoint_private_access" {
  description = "Whether to enable private access to EKS control plane endpoint"
  type = bool
  default = false
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "list of cidr blocks allowed to access public eks endpoint"
  type = list(string)
  default = ["0.0.0.0/0"]
}

variable "tags" {
  description = "Tags to give to resources"
  type = map(string)
  default = {
    "Owner" = "Krutarth Patel"
    "Terraform" = "true"
  }
}

variable "node_instance_types" {
  description = "list of EC2 instance types for the node group"
  type = list(string)
  default = ["t3.micro"]
}

variable "node_capacity_types" {
   description = "Instance capacity type: on demand or Spot"
  type = string
  default = "ON_DEMAND"
}

variable "node_disk_size" {
    description = "Disk size in GiB fro worker nodes"
    type = number
    default = 20
}
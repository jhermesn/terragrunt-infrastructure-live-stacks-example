terraform {
  source = "tfr:///terraform-aws-modules/security-group/aws?version=6.0.0"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

inputs = {
  name        = "MyFirstInstanceSG"
  description = "Security Group for My First EC2 Instance"
  vpc_id      = "vpc-0c733e93b4943be94" // Default VPC

  ingress_rules = {
    ssh = {
      ip_protocol = "tcp"
      from_port   = "22"
      to_port     = "22"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }

  egress_rules = {
    all = {
      ip_protocol = "-1"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }
}

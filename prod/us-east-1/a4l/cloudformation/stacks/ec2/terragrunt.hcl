terraform {
  source = "tfr:///boldlink/cloudformation/aws?version=1.1.2"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

inputs = {
  stack_name    = "cfndemo1"
  template_body = file("${get_terragrunt_dir()}/ec2instance.yaml")
  capabilities  = ["CAPABILITY_IAM"]

  parameters = {
    SubnetId          = "subnet-09e8a98162e9c544d"
    VpcId             = "vpc-0c733e93b4943be94"
  }
}
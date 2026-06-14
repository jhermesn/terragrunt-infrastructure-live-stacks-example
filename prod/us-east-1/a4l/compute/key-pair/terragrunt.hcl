terraform {
  source = "tfr:///terraform-aws-modules/key-pair/aws?version=3.0.0"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

inputs = {
  key_name   = "a4l-prod"
  public_key = file("./a4l-prod.pub")
}

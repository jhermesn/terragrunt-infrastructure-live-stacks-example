terraform {
  source = "tfr:///terraform-aws-modules/s3-bucket/aws?version=5.14.0"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

inputs = {
  bucket = "koalacampaign1333333773733"

    force_destroy = true

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

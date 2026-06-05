terraform {
  source = "tfr:///terraform-aws-modules/ec2-instance/aws?version=6.4.0"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

dependencies {
  paths = ["../../key-pair"]
}

dependency "ssh_sg" {
  config_path = "../../security-groups/my-first-ec2-sg"

  mock_outputs_merge_strategy_with_state = "shallow"
  mock_outputs = {
    security_group_id = "sg-00000000000000000"
  }
}

inputs = {
  name = "MyFirstEC2Instance"

  ami                         = "ami-074bb5e3c681b0735" // AL2023
  instance_type               = "t3.micro"
  key_name                    = "a4l-prod"
  subnet_id                   = "subnet-09e8a98162e9c544d" // 1f
  vpc_security_group_ids      = [dependency.ssh_sg.outputs.security_group_id]
  associate_public_ip_address = true

  root_block_device = [
    {
      volume_type           = "gp3"
      volume_size           = 8
      delete_on_termination = true
    }
  ]
}

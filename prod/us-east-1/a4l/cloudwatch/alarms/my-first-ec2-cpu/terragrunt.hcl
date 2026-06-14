terraform {
  source = "tfr:///terraform-aws-modules/cloudwatch/aws//modules/metric-alarm?version=5.7.2"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

dependency "ec2" {
  config_path = "../../../ec2/instances/my-first-ec2"

  mock_outputs = {
    id = "i-00000000000000000"
  }
}

inputs = {
  alarm_name          = "my-first-ec2-high-cpu"
  alarm_description   = "EC2 CPU utilization above 80% for 5 minutes"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 80

  dimensions = {
    InstanceId = dependency.ec2.outputs.id
  }

  treat_missing_data = "notBreaching"
}

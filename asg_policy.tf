
# WEB ------------------------------------------------------------------
#SCALE UP
resource "aws_autoscaling_policy" "web_cpu_policy_scaleup" {
  name                   = "web_cpu_policy_scaleup_policy"
  autoscaling_group_name = aws_autoscaling_group.web.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "1"
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}

#SCALE DOWN
resource "aws_autoscaling_policy" "web_cpu_policy_scaledown" {
  name                   = "web_cpu_policy_scaledown"
  autoscaling_group_name = aws_autoscaling_group.web.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "-1"
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}

# scale up when avg cpu usage over 70%

resource "aws_cloudwatch_metric_alarm" "web_cpu_alarm_scaleup" {
  alarm_name          = "web-cpu-alarm-scaleup"
  alarm_description   = "web-cpu-alarm-scaleup"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "70"

  dimensions = {
    "AutoScalingGroupName" = "${aws_autoscaling_group.web.name}"
  }

  actions_enabled = true
  alarm_actions   = ["${aws_autoscaling_policy.web_cpu_policy_scaleup.arn}"]
}

# scale down when avg cpu usage under 30%

resource "aws_cloudwatch_metric_alarm" "web_cpu_alarm_scaledown" {
  alarm_name          = "web_cpu_alarm_scaledown"
  alarm_description   = "web_cpu_alarm_scaledown"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "30"

  dimensions = {
    "AutoScalingGroupName" = "${aws_autoscaling_group.web.name}"
  }

  actions_enabled = true
  alarm_actions   = ["${aws_autoscaling_policy.web_cpu_policy_scaledown.arn}"]
}

# APPLICATION ------------------------------------------------------------------
#SCALE UP
resource "aws_autoscaling_policy" "app_cpu_policy_scaleup" {
  name                   = "app_cpu_policy_scaleup_policy"
  autoscaling_group_name = aws_autoscaling_group.application.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "1"
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}

#SCALE DOWN
resource "aws_autoscaling_policy" "app_cpu_policy_scaledown" {
  name                   = "app_cpu_policy_scaledown"
  autoscaling_group_name = aws_autoscaling_group.application.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "-1"
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}

# scale up when avg cpu usage over 70%

resource "aws_cloudwatch_metric_alarm" "app_cpu_alarm_scaleup" {
  alarm_name          = "app-cpu-alarm-scaleup"
  alarm_description   = "app-cpu-alarm-scaleup"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "70"

  dimensions = {
    "AutoScalingGroupName" = "${aws_autoscaling_group.application.name}"
  }

  actions_enabled = true
  alarm_actions   = ["${aws_autoscaling_policy.app_cpu_policy_scaleup.arn}"]
}

# scale down when avg cpu usage under 30%

resource "aws_cloudwatch_metric_alarm" "app_cpu_alarm_scaledown" {
  alarm_name          = "app_cpu_alarm_scaledown"
  alarm_description   = "app_cpu_alarm_scaledown"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "30"

  dimensions = {
    "AutoScalingGroupName" = "${aws_autoscaling_group.application.name}"
  }

  actions_enabled = true
  alarm_actions   = ["${aws_autoscaling_policy.app_cpu_policy_scaledown.arn}"]
}
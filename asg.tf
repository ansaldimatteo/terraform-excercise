//WEB ------------------------------------------------
resource "aws_autoscaling_group" "web" {
  name = "${aws_launch_configuration.web.name}-asg"

  min_size         = 1
  desired_capacity = 1
  max_size         = 3


  target_group_arns = [aws_lb_target_group.target_elb_web.id]

  launch_configuration = aws_launch_configuration.web.name

  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupTotalInstances"
  ]

  metrics_granularity = "1Minute"

  vpc_zone_identifier = module.vpc.public_subnets


  tag {
    key                 = "Name"
    value               = "web"
    propagate_at_launch = true
  }

  depends_on = [
    aws_lb.application_external_alb,
  ]
}

//APPLICATION ----------------------------------------
resource "aws_autoscaling_group" "application" {
  name = "${aws_launch_configuration.application.name}-asg"

  min_size         = 1
  desired_capacity = 1
  max_size         = 3


  target_group_arns = [aws_lb_target_group.target_elb_application.id]

  launch_configuration = aws_launch_configuration.application.name

  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupTotalInstances"
  ]

  metrics_granularity = "1Minute"

  vpc_zone_identifier = module.vpc.public_subnets


  tag {
    key                 = "Name"
    value               = "application"
    propagate_at_launch = true
  }
}
//WEB ----------------------------------------------------
resource "aws_lb" "web-external-alb" {
  name               = "web-external-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.ingress-http-all.id}"]
  subnets            = module.vpc.public_subnets
}

resource "aws_lb_target_group" "target-elb-web" {
  name     = "ALB-TG-WEB"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
}

resource "aws_lb_listener" "listener_http_web" {
  load_balancer_arn = aws_lb.web-external-alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target-elb-web.arn
  }
}

//APPLICATION ----------------------------------------------
resource "aws_lb" "application-external-alb" {
  name               = "application-external-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.ingress-http-all.id}"]
  subnets            = module.vpc.public_subnets
}

resource "aws_lb_target_group" "target-elb-application" {
  name     = "ALB-TG-APPLICATION"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
}

resource "aws_lb_listener" "listener_http_application" {
  load_balancer_arn = aws_lb.application-external-alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target-elb-application.arn
  }
}
// WEB -------------------------------------------------------
resource "aws_launch_configuration" "web" {
  name_prefix = "web-"

  image_id      = "ami-0d527b8c289b4af7f" # Ubuntu 20.04
  instance_type = "t2.micro"
  key_name      = var.ec2_key_pair

  security_groups = [
    aws_security_group.ingress_http_web_all.id,
    aws_security_group.ingress_bh.id,
  ]
  associate_public_ip_address = true


  user_data = data.template_file.init_web.rendered
}

data "template_file" "init_web" {
  template = file("scripts/web-data.sh")

  vars = {
    app_url = "${aws_lb.application_external_alb.dns_name}"
  }
}

//APPLICATION -----------------------------------------------------
resource "aws_launch_configuration" "application" {
  name_prefix = "application-"

  image_id      = "ami-0d527b8c289b4af7f" # Ubuntu 20.04
  instance_type = "t2.micro"
  key_name      = var.ec2_key_pair

  security_groups = [
    aws_security_group.ingress_http_app_all.id,
    aws_security_group.ingress_bh.id,
  ]
  associate_public_ip_address = true


  user_data = file("scripts/application-data.sh")
}
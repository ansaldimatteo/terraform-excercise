//ALB
resource "aws_security_group" "ingress_http_all" {
  name   = "allow-http-all"
  vpc_id = module.vpc.vpc_id
  # HTTP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.http_ip_cidr}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

//BH
resource "aws_security_group" "ingress_ssh_my_ip" {
  name   = "allow-ssh-my-ip"
  vpc_id = module.vpc.vpc_id
  # SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.my_public_ip_cidr}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

//WEB servers
resource "aws_security_group" "ingress_http_web_all" {
  name   = "allow-http-web-all"
  vpc_id = module.vpc.vpc_id
  # HTTP
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = ["${aws_security_group.ingress_http_all.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

//APP servers
resource "aws_security_group" "ingress_http_app_all" {
  name   = "allow-http-app-all"
  vpc_id = module.vpc.vpc_id
  # HTTP
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = ["${aws_security_group.ingress_http_all.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

//DB servers
resource "aws_security_group" "ingress_mysql_app" {
  name   = "allow-mysql-app"
  vpc_id = module.vpc.vpc_id
  # MySQL
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = ["${aws_security_group.ingress_http_app_all.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

//ACCESS FROM BH
resource "aws_security_group" "ingress_bh" {
  name   = "allow-bh"
  vpc_id = module.vpc.vpc_id
  # SSH from BH
  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = ["${aws_security_group.ingress_ssh_my_ip.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
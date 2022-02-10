//DB --------------------------------------------
resource "aws_instance" "db_server" {
  ami           = "ami-0d527b8c289b4af7f" # Ubuntu 20.04
  instance_type = "t2.micro"
  key_name      = var.ec2_key_pair
  vpc_security_group_ids = [
    "${aws_security_group.ingress-mysql-app.id}",
    "${aws_security_group.ingress-bh.id}",
  ]

  tags = {
    Name = "DBServerInstance"
  }

  subnet_id  = module.vpc.private_subnets[0]
  private_ip = "10.0.1.5"
  user_data  = file("scripts/db-data.sh")

  depends_on = [
    module.vpc.natgw_ids,
  ]
}

//BH ---------------------------------------------
resource "aws_instance" "bastion_host_server" {
  ami                    = "ami-0d527b8c289b4af7f" # Ubuntu 20.04
  instance_type          = "t2.micro"
  key_name               = var.ec2_key_pair
  vpc_security_group_ids = ["${aws_security_group.ingress-ssh-my-ip.id}"]

  tags = {
    Name = "BHServerInstance"
  }
  subnet_id = module.vpc.public_subnets[0]
}

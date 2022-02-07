resource "aws_instance" "general_server" {
  ami                    = "ami-04c921614424b07cd"
  instance_type          = "t2.micro"
  key_name               = var.ec2_key_pair
  vpc_security_group_ids = ["${aws_security_group.ingress-all-test.id}"]

  tags = {
    Name = "ExerciseServerInstance"
  }
  subnet_id = aws_subnet.public_subnet_1.id
  user_data = file("data.sh")
}

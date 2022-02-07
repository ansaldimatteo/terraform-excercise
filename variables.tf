variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "subnet_pub_cidr" {
  description = "Available cidr blocks for public subnets."
  type        = list(string)
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24",
  ]
}


variable "subnet_pri_cidr" {
  description = "Available cidr blocks for private subnets."
  type        = list(string)
  default = [
    "10.0.10.0/24",
    "10.0.11.0/24",
    "10.0.12.0/24",
  ]
}

variable "ec2_key_pair" {
  description = "Keypair name for EC2 instances"
  type        = string
  default     = "frankfurt-keypair"
}

variable "my_public_ip_cidr" {
  description = "CIDR range to access the public EC2 instance"
  type        = string
  default     = "0.0.0.0/0"
}

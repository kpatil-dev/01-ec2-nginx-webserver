data "aws_vpc" "default" {
  default = true
}
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }

}
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-kernel-*-x86_64"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_security_group" "web_sg" {
  name        = "${var.project_name}-sg"
  description = "allow http traffic"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "Allow HTTP traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    description = "Allow all otbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"          #allows all protocols
    cidr_blocks = ["0.0.0.0/0"] #any ipv4 address
  }
}

resource "aws_instance" "web_server" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  subnet_id     = data.aws_subnets.default.ids[0]

  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true
  tags = {
    Name        = "${var.project_name}-server"
    Project     = var.project_name
    Environment = "Development"
    Managedby   = "Terraform"
  }
  user_data = file("${path.module}/userdata.sh")

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }
  monitoring = false

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }
}

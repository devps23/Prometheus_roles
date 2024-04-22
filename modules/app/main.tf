resource "aws_instance" "prometheus" {
  ami = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.security.id]
  tags = {
    Name = var.tools_name
  }
  iam_instance_profile = aws_iam_instance_profile.instance_profile.name
}
data "aws_security_group" "security" {
  name = "allow-all"
}

//create Prometheus roles
resource "aws_iam_role" "role" {
  name = "Prometheus-role"
  assume_role_policy = jsonencode({

    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    name = "Prometheus-role"
  }
}
//it is a container
resource "aws_iam_instance_profile" "instance_profile" {
  name = "Prometheus-role"
  role = aws_iam_role.role.name
}
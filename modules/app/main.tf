//resource "aws_instance" "prometheus" {
//  ami = var.ami
//  instance_type = var.instance_type
//  vpc_security_group_ids = [data.aws_security_group.security.id]
//  tags = {
//    Name = var.tools_name
//  }
//}
//data "aws_security_group" "security" {
//  name = "allow-all"
//}

//create Prometheus role
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
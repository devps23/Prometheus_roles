resource "aws_instance" "prometheus" {
  ami = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.security.id]
  tags = {
    Name = var.tools_name
  }
}
data "aws_security_group" "security" {
  name = "allow-all"
}

//create Prometheus role
resource "aws_iam_role" "iam_role" {
  name = "${var.tools_name} - role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
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
    name = "${var.tools_name} - role"
  }
}
resource "aws_iam_role" "CodeDeployInstanceRole" {
  name = "CodeDeployInstanceRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid = ""
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name = "CodeDeploy Role For EC2 Instances"
  }

  lifecycle {
    create_before_destroy = true
  }
}

data "aws_iam_policy" "AmazonS3FullAccess" {
  arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

data "aws_iam_policy" "AmazonEC2RoleforAWSCodeDeploy" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforAWSCodeDeploy"
}

resource "aws_iam_policy_attachment" "s3_full_access_attachment" {
  name = "s3-full-access-attachment"
  policy_arn = data.aws_iam_policy.AmazonS3FullAccess.arn
  roles = [aws_iam_role.CodeDeployInstanceRole.name]
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_policy_attachment" "ec2_role_for_code_deploy_attachment" {
  name       = "ec2-role-for-code-deploy-attachment"
  policy_arn = data.aws_iam_policy.AmazonEC2RoleforAWSCodeDeploy.arn
  roles = [aws_iam_role.CodeDeployInstanceRole.name]
  lifecycle {
    create_before_destroy = true
  }
}

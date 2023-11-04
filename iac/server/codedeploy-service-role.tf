resource "aws_iam_role" "CodeDeployServiceRole" {
  name = "CodeDeployServiceRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid = ""
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "codedeploy.amazonaws.com"
        }
      }
    ]
  })
  lifecycle {
    create_before_destroy = true
  }
}

data "aws_iam_policy" "AWSCodeDeployRole" {
  arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
}

resource "aws_iam_policy_attachment" "s3_full_access_attachments" {
  name = "s3-full-access-attachment"
  policy_arn = data.aws_iam_policy.AmazonS3FullAccess.arn
  roles = [aws_iam_role.CodeDeployServiceRole.name]
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_policy_attachment" "code_deploy_attachment" {
  name       = "code-deploy-attachment"
  policy_arn = data.aws_iam_policy.AWSCodeDeployRole.arn
  roles = [aws_iam_role.CodeDeployServiceRole.name]
  lifecycle {
    create_before_destroy = true
  }
}

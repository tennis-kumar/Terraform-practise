provider "aws" {
  region = var.aws_region
}

# Create a new S3 bucket (name must be globally unique)
resource "aws_s3_bucket" "practice_bucket" {
  bucket = var.s3_bucket_name

  tags = {
    Name        = "PracticeBucket"
    Environment = var.environment
  }
}

# IAM role for EC2 to access S3
resource "aws_iam_role" "ec2_role" {
  name = "ec2_s3_access_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

# Attach read-only S3 policy to the IAM role
resource "aws_iam_role_policy_attachment" "s3_readonly" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

# Create instance profile to attach IAM role to EC2
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_s3_profile"
  role = aws_iam_role.ec2_role.name
}

# Create an EC2 instance
resource "aws_instance" "practice_ec2" {
  ami                  = var.ec2_ami_id
  instance_type        = var.ec2_instance_type
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  tags = {
    Name        = "PracticeEC2"
    Environment = var.environment
  }
}

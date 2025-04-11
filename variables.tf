variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

variable "s3_bucket_name" {
  description = "A globally unique name for the S3 bucket"
  type        = string
  default     = "kumar-terraform-test-bucket-20250411"
}

variable "ec2_ami_id" {
  description = "Amazon Linux 2 AMI for ap-south-1"
  type        = string
  default     = "ami-03bb6d83c60fc5f7c"
}

variable "ec2_instance_type" {
  description = "Instance type for EC2"
  type        = string
  default     = "t2.micro"
}

variable "environment" {
  description = "Environment tag (dev/staging/prod)"
  type        = string
  default     = "dev"
}

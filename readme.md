# Terraform AWS Practice Setup

This project deploys a free-tier EC2 instance with S3 access on a fresh AWS account using Terraform.

## What It Does
- Creates an S3 bucket (you provide the name)
- Creates an IAM role and instance profile with S3 read-only access
- Launches a t2.micro EC2 instance with that role attached

## Requirements
- Terraform installed
- AWS CLI configured

## How to Use

### 1. Clone the repo or create these files
Make sure you're in an empty directory with:
- `main.tf`
- `variables.tf`
- `outputs.tf`

### 2. Initialize Terraform
```bash
terraform init

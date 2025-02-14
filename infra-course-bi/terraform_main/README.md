# Terraform Infrastructure Project

## Overview
This project automates AWS infrastructure deployment using Terraform.  
It manages two environments: **`dev`** and **`prod`**, provisioning **VPC, EC2, and Aurora MySQL**.

---

## Directory Structure
terraform_main/
├── env/
│   ├── dev/
│   │   ├── backend.tf
│   │   ├── main.tf
│   │   ├── provider.tf
│   │   ├── terraform.tfvars
│   │   ├── variables.tf
│   ├── prod/
│   │   ├── backend.tf
│   │   ├── main.tf
│   │   ├── provider.tf
│   │   ├── terraform.tfvars
│   │   ├── variables.tf
│
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   ├── ec2/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   ├── aurora/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│
└── README.md

## Prerequisites
- **Terraform Version**: `1.10.4`
- **AWS CLI Installed**
- **AWS Credentials Configured** (`~/.aws/config`)
- **S3 Bucket** (for `backend.tf` state storage)
- **Aurora Parameter Groups** (for RDS configuration)
- **Elastic IP (EIP)** (for EC2 instance)
- **EC2 Key Pair** (for SSH access)

### Example AWS profile configuration (`~/.aws/config`):
[profile terraform]
region = ap-northeast-1
output = json

[profile dev]
region = ap-northeast-1
role_arn = arn:aws:iam::637423323564:role/***
source_profile = terraform

[profile prod]
region = ap-northeast-1
role_arn = arn:aws:iam::730335335110:role/***
source_profile = terraform

## Usage

### 1. Initialize Terraform
```sh
terraform init
```
### 2. Plan
For dev environment:
```sh
terraform plan -var="environment=dev"
```
For prod environment:
```sh
terraform plan -var="environment=prod"
```
### 3. Apply
For dev environment:
```sh
terraform apply -var="environment=dev" -auto-approve
```
For prod environment:
```sh
terraform apply -var="environment=prod" -auto-approve
```
### 4. Destroy (if needed)
For dev environment:
```sh
terraform destroy -var="environment=dev" -auto-approve
```
For prod environment:
```sh
terraform destroy -var="environment=prod" -auto-approve
```


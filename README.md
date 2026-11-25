
# Project 01 - Automated AWS EC2 Nginx Web Server

## Overview
Provisioned an AWS EC2 web server using Terraform.
Configured Nginx automatically using EC2 User Data.

## Architecture
- AWS EC2
- Amazon Linux 2023
- Custom AWS Security Group
- Default VPC and subnet
- Internet Gateway connectivity
- Nginx Web Server
- Terraform Outputs

## Features
- Infrastructure as Code using Terraform
- Dynamic AMI discovery
- Security Group configuration
- Automated Nginx installation
- Custom HTML webpage
- IMDSv2 enforcement
- EC2 tagging
- Terraform outputs

## Tools Used
- AWS
- Terraform
- Linux
- Bash
- Git
- GitHub

## Project Structure
- providers.tf
- variables.tf
- main.tf
- userdata.sh
- outputs.tf
- .gitignore

## Deployment

Initialize:
terraform init

Validate:
terraform validate

Plan:
terraform plan

Deploy:
terraform apply

Destroy:
terraform destroy

## Learning Outcomes
- Terraform resources and data sources
- AWS VPC and subnet concepts
- Security Groups and network access
- EC2 provisioning
- Linux package management
- Bash scripting
- Terraform outputs

## Author
AWS and Terraform Learning Projects

variable "aws_region" {
  description = "this is aws regon where resources will be deployed"
  type        = string
  default     = "ap-south-1"
}
variable "instance_type" {
  description = "EC2 instance type for the web server"
  type        = string
  default     = "t3.small"
}
variable "project_name" {
  description = "Name of the project used for resource tagging"
  type        = string
  default     = "ec2-nginx-webserver"
}
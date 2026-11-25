output "instance_public_ip" {
  description = "Public IP address of the EC2 web server"
  value       = aws_instance.web_server.public_ip
}

# resource_type.resource_name.attribute
# - aws_instance — resource type.
# - web_server — name we assigned to the resource in main.tf.
# - public_ip — attribute containing its public IP address.
output "instance_id" {
  description = "ID of the EC2 web server"
  value       = aws_instance.web_server.id
}
output "instance_public_dns" {
  description = "Public DNS name of the EC2 web server"
  value       = aws_instance.web_server.public_dns
}
output "security_group_id" {
  description = "ID of the web server security group"
  value       = aws_security_group.web_sg.id
}

output "ami_id" {
  description = "AMI ID used to launch the EC2 instance"
  value       = aws_instance.web_server.ami
}
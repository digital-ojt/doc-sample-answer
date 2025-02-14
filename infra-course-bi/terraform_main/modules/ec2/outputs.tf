output "ec2_instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.ec2.id
}

output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.ec2.public_ip
}
output "ec2_security_group_id" {
  description = "Security Group ID of EC2"
  value       = aws_security_group.ec2_sg.id
}

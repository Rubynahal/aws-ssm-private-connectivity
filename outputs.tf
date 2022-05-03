output "ssm_security_group_id" {
  description = "Name of the security group for ssm endpoints"
  value       = aws_security_group.ssm_sg.id
}


output "vpc_id" {
  description = "ID of the lab VPC"
  value       = aws_vpc.this.id
}

output "public_subnet_ids" {
  description = "Public subnet IDs by Availability Zone"
  value       = { for zone, subnet in aws_subnet.public : zone => subnet.id }
}

output "private_subnet_ids" {
  description = "Private subnet IDs by Availability Zone"
  value       = { for zone, subnet in aws_subnet.private : zone => subnet.id }
}

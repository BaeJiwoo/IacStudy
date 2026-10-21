output "vpc_id" {
  value = aws_vpc.this.id
}

# TODO: Return public and private subnet IDs by Availability Zone.

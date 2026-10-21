package terraform.security

# Evaluate with a Terraform plan converted by `terraform show -json tfplan`.

required_tags := {"Owner", "Environment", "CostCenter", "ManagedBy"}

deny[msg] {
  resource := input.resource_changes[_]
  tags := object.get(resource.change.after, "tags", {})
  missing := required_tags - {tag | tags[tag]}
  count(missing) > 0
  msg := sprintf("%s is missing required tags: %v", [resource.address, missing])
}

deny[msg] {
  resource := input.resource_changes[_]
  resource.type == "aws_security_group_rule"
  resource.change.after.type == "ingress"
  resource.change.after.from_port <= 22
  resource.change.after.to_port >= 22
  resource.change.after.cidr_blocks[_] == "0.0.0.0/0"
  msg := sprintf("%s exposes SSH to the internet", [resource.address])
}

# TODO: Deny unencrypted storage resources.
# TODO: Require an additional approval marker when a production resource is deleted.

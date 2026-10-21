variable "aws_region" {
  type    = string
  default = "ap-northeast-2"
}

variable "github_organization" {
  description = "GitHub organization or user that owns the repository"
  type        = string
}

variable "github_repository" {
  description = "GitHub repository allowed to assume the CI role"
  type        = string
}

variable "github_branch" {
  description = "Branch allowed to assume the CI role"
  type        = string
  default     = "main"
}

variable "github_oidc_thumbprint" {
  description = "Current certificate thumbprint verified from the GitHub OIDC endpoint"
  type        = string
  sensitive   = true
}

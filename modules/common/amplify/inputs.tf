variable "repo_url" {
  description = "The repository to deploy"
  type        = string
}

variable "app_name" {
  description = "The name of the app"
  type        = string
}

variable "PAT" {
    description = "The Personal Access Token for the repository"
    type        = string
    sensitive = true
}

variable "branch_name" {
    description = "The name of the branch"
    type        = string
  default = "main"
}

variable "user_pool_id" {
    description = "User Pool id"
    type        = string
}

variable "user_pool_client_id" {
    description = "User Pool client id"
    type        = string
}

variable "identity_pool_id" {
    description = "Identity Pool id"
    type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default = "us-east-1"
}
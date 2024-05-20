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

variable "pool_id" {
    description = "Pool id"
    type        = string
}

variable "pool_client_id" {
    description = "Pool client id"
    type        = string
}
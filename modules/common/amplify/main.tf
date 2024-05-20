resource "aws_amplify_app" "this" {
  name       = var.app_name
  repository = var.repo_url
  access_token = var.PAT

  build_spec = <<-EOT
    version: 0.1
    frontend:
      phases:
        preBuild:
          commands:
            - yarn install
        build:
          commands:
            - yarn run build
      artifacts:
        baseDirectory: dist
        files:
          - '**/*'
      cache:
        paths:
          - node_modules/**/*
  EOT


  tags = {
    Name = var.app_name
  }
}

resource "aws_amplify_branch" "this" {
  app_id = aws_amplify_app.this.id
  branch_name = var.branch_name
  framework = "React"
  stage = "DEVELOPMENT"
  tags = {
    name = var.branch_name
  }
  environment_variables = {
    USER_POOL_ID = var.pool_id
    USER_POOL_CLIENT_ID = var.pool_client_id
  }
}

resource "aws_amplify_backend_environment" "this" {
  app_id      = aws_amplify_app.this.id
  environment_name = "dev"
}

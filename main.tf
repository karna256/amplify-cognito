module "amplify" {
  source      = "./modules/common/amplify"
  app_name    = "my-amplify-app"
  repo_url    = "https://github.com/karnaankit/react-frontend"
  PAT         = var.PAT
  pool_client_id = module.cognito.pool_client_id
  pool_id = module.cognito.pool_id
}

module "cognito" {
  source = "./modules/common/cognito"
}
# testing username
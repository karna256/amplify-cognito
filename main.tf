module "amplify" {
  source      = "./modules/common/amplify"
  app_name    = "my-amplify-app"
  repo_url    = "https://github.com/karnaankit/react-frontend"
  PAT         = var.PAT
  user_pool_client_id = module.cognito.pool_client_id
  user_pool_id = module.cognito.pool_id
  identity_pool_id = module.cognito.identity_pool_id
  depends_on = [module.cognito]
}

module "cognito" {
  source = "./modules/common/cognito"
}
# testing username
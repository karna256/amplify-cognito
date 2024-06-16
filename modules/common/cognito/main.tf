resource "aws_cognito_user_pool" "this" {
  name = "ankit_user_pool"

  password_policy {
    minimum_length    = 8
    require_lowercase = true
    require_numbers   = true
    require_symbols   = true
    require_uppercase = true
  }
  mfa_configuration          = "OFF"
  tags = {
    Name = "ankit_user_pool"
  }
}

resource "aws_cognito_user_pool_client" "this" {
  name            = "ankit_react_client"
  user_pool_id    = aws_cognito_user_pool.this.id
  generate_secret = false
}

resource "aws_cognito_identity_pool" "this" {
  identity_pool_name = "ankit_identity_pool"
  allow_unauthenticated_identities = false
    cognito_identity_providers {
        client_id               = aws_cognito_user_pool_client.this.id
        provider_name           = aws_cognito_user_pool.this.endpoint
        server_side_token_check = false
    }
}


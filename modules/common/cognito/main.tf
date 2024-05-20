resource "aws_cognito_user_pool" "this" {
  name = "ankit_user_pool"

  password_policy {
    minimum_length    = 8
    require_lowercase = true
    require_numbers   = true
    require_symbols   = true
    require_uppercase = true
  }
  tags = {
    Name = "ankit_user_pool"
  }
}

resource "aws_cognito_user_pool_client" "this" {
  name            = "name_user_pool_client"
  user_pool_id    = aws_cognito_user_pool.this.id
  generate_secret = true
}


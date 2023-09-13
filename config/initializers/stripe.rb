# Rails.configuration.stripe = {
#   publishable_key: 'pk_test_51NmzNCSEtCoZrsXCSkqKytPMy9rPOWn6wxwvzhD06uHsAojSP1SuiVFl9ZoPfV2ckPmzzxVOmmP9WLNU7nCw2rgU00zu9HNk1K',
#   secret_key: 'sk_test_51NmzNCSEtCoZrsXCn7Dx25oZDPgz47pcDo64gsbJhpD3OXV3leLN8dbBtoXH08mUoO1IVWoWXU80jHZa4zArIy0R00yAlJ5EZq'
# }

# Stripe.api_key = Rails.configuration.stripe[:secret_key]

Rails.configuration.stripe = {
  :publishable_key => ENV['PUBLISHABLE_KEY'],
  :secret_key      => ENV['SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]

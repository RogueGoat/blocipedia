# Store the environment variables on the Rails.configuration object
 Rails.configuration.stripe = {
   publishable_key: ENV['pk_live_u3LVP4GcfEKZlQfE2AM1KOXk'],
   secret_key: ENV['sk_live_gZCNNQOeKf3rjyr3FNFCsyKZ']
 }
 
 # Set our app-stored secret key with Stripe
 Stripe.api_key = Rails.configuration.stripe[:secret_key]
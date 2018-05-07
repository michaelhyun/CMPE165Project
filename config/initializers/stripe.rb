Rails.configuration.stripe = {
    :publishable_key => 'pk_test_hKTEieGBdzC576jvW2VKih5H',
    :secret_key => 'sk_test_CGL6lcfHYFFonZfNPo4cGXK2'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]

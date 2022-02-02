# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    if Rails.env.production?
      origins 'mexiqui.to'
      puts 'cors origin: mexiqui.to'
    else
      origins '*'
      puts 'cors origin: *'
    end

    resource '*',
             headers: :any,
             methods: %i[get post put patch delete options head],
             # Required for the jwt to be available to the client
             expose: ['Authorization']
  end
end

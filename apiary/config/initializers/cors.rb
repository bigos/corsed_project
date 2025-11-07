# CORS for the API

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*', 'https://localhost', 'http://localhost:3000',
            'https://localhost:5010/secondary', 'http://localhost:3001'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end

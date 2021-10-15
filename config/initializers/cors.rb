Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'http://playcmd.s3-website.eu-west-1.amazonaws.com'
      resource '*', headers: :any, methods: [:post, :put]
    end
  end
require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "e06cc8c2de06f1e59b50d4f6f94be573f4ae4c7bc4a465e44ca5898a3aa970ee"

  url_format "/media/:job/:name"

  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end

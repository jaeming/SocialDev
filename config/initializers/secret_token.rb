Bloccit::Application.config.secret_key_base = ENV["SECRET_KEY_BASE"]

Devise.setup do |config|
  config.secret_key = ENV['DEVISE_SECRET_KEY']
end
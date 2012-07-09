OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '383888801666970', '3c59d9d0ab70abd9b56e8488344da986', display: :popup
end
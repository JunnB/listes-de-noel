require "http_basic_auth"
Rails.application.config.middleware.use HttpBasicAuth

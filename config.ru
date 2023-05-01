# This file is used by Rack-based servers to start the application.

require_relative "config/environment"

run Rails.application
Rails.application.load_server


require 'rack/cors'
use Rack::Cors do
  allow do
    origins '*' # You can specify the domains you want to allow
    resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options]
  end
end
source 'https://rubygems.org'

ruby '3.2.2'

gem 'rails', '~> 7.1.3', '>= 7.1.3.2'

gem 'importmap-rails'
gem 'jbuilder'
gem 'pg', '~> 1.1'
gem 'puma', '>= 5.0'
gem 'redis', '>= 4.0.1'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'

gem 'devise'
gem 'devise_token_auth'
gem 'omniauth'
gem 'omniauth-oauth2'
gem 'jwt'

gem 'jsonapi-resources'
gem 'rack-cors'

gem 'doorkeeper'
gem 'graphql'

gem 'pycall'

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'bootsnap', require: false
gem 'tzinfo-data', platforms: %i[windows jruby]

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  gem 'debug', platforms: %i[mri windows]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails'
end

group :development do
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"
  gem 'graphiql-rails'
  gem 'spring'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'cucumber'
  gem 'selenium-webdriver'
end

source 'https://rubygems.org'

ruby '2.2.0'

gem 'rails', '4.2.0'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'slim-rails'
gem 'pg'
gem 'sidekiq'
gem 'bcrypt'
gem 'thin'
gem 'activerecord-import', '~> 0.7.0'
gem 'kaminari'
gem 'oj'
gem 'multi_json'

group :development, :test do
  gem 'rspec-rails', '~> 3.0.0'
  gem 'database_cleaner'
  gem 'fuubar'
  gem 'factory_girl_rails'
  gem 'shoulda'
  gem 'api_matchers'
  gem 'spring'
  gem 'byebug'
  gem 'pry-rails'
end

group :development do
  gem 'capistrano', '~> 3.2.0', require: false
  gem 'capistrano-rails', '~> 1.1', require: false
  gem 'capistrano-bundler', '~> 1.1', require: false
  gem 'capistrano-thin', '~> 1.1', require: false
  gem 'capistrano-rvm', '~> 0.1', require: false
end


group :test do
  gem 'selenium-webdriver'
  gem 'poltergeist'
  gem 'codeclimate-test-reporter', require: nil
end

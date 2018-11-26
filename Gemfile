source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.1'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'passenger', '~> 5.3', '>= 5.3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'mini_magick', '~> 4.8'
gem 'devise', '~> 4.5'
gem 'materialize-sass', '~> 1.0.0.rc1'
gem 'font-awesome-sass', '~> 5.3.1'
gem 'jquery-rails', '~> 4.3', '>= 4.3.3'
gem 'toastr-rails', '~> 1.0', '>= 1.0.3'
gem 'jquery-ui-rails', '~> 5.0'
gem 'geocoder', '~> 1.5'
gem 'omniauth-facebook', '~> 5.0'
gem 'chartkick', '~> 3.0', '>= 3.0.1'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'aws-sdk-s3', '~> 1.0.0.rc2'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'capistrano', '~> 3.11'
  gem 'capistrano-rails', '~> 1.4'
  gem 'capistrano-passenger', '~> 0.2.0'
  gem 'capistrano-rvm', '~> 0.1.2'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

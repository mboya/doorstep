source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'
gem 'bootsnap', require: false
gem 'devise'
gem 'doorkeeper'
gem 'doorkeeper-jwt'
gem 'jsonapi-resources'
gem 'makara'
gem 'pg', '~> 1.1'
gem 'phonelib'
gem 'puma', '~> 5.0'
gem 'rack-cors'
gem 'rails', '~> 7.0.6'
gem 'rails-healthcheck'
gem 'redis', '~> 4.0'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]


group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'rubocop'
end

group :development do
  gem 'annotate'
  gem 'faker'
  gem 'nib'
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end


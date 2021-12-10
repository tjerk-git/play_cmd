source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"

gem "rails", "~> 7.0.0.rc1"
gem "sqlite3", "~> 1.4"
gem "puma", "~> 5.0"
gem "jsbundling-rails", "~> 0.1.0"
gem "turbo-rails", ">= 0.8.3"
gem "stimulus-rails", ">= 0.4.0"
gem "cssbundling-rails", ">= 0.1.0"
gem "jbuilder", "~> 2.7"
gem "redis", "~> 4.0"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", ">= 1.4.4", require: false
gem "image_processing", "~> 1.2"
gem 'devise', git: 'https://github.com/heartcombo/devise', branch: 'main'
gem "action_policy-graphql", "~> 0.4"
gem "graphql"
gem "graphql_playground-rails"
gem 'jwt'
gem 'rack-cors'

group :development, :test do
  gem "debug", ">= 1.0.0", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console", ">= 4.1.0"
  gem 'graphiql-rails'
end

group :test do
  gem "capybara", ">= 3.26"
  gem "selenium-webdriver"
  gem "webdrivers"
end

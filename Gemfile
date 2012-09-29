source 'https://rubygems.org'

gem 'httparty'
gem 'jquery-rails'
gem 'rails', '3.2.8'

# Enhances OpenStruct in that it allows nested hashes to be treated in a recursive fashion.
gem 'recursive-open-struct'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :production do
  gem 'pg'
end

group :development, :test do
  gem "rspec-rails", "~> 2.0"
  gem 'sqlite3'
end

group :test do
  gem "capybara"
  gem 'pry'

  # Given/When/Then steps for RSpec examples
  gem "rspec-example_steps"

  gem 'vcr'
  gem 'webmock'
end



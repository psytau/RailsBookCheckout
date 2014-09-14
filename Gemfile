source 'https://rubygems.org'
ruby '2.1.1'


gem 'rails', '4.1.4'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'devise'
gem 'devise_invitable', '~> 1.3.4'
gem 'twitter-bootstrap-rails'
gem 'cancancan'
gem 'rolify'
gem 'public_activity'

gem 'elasticsearch-model'
gem 'elasticsearch-rails'
gem 'bonsai-elasticsearch-rails'

gem 'simplecov', :require => false, :group => :test

group :development, :test do
  gem 'rspec-rails', '~> 3.0.0'
  gem 'sqlite3'
  gem "factory_girl_rails", "~> 4.0"
  gem 'launchy'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'cucumber-slices'
  gem 'thin'
  gem 'jazz_hands'
  gem 'letter_opener'
  gem 'powder'
end
group :production do
  gem 'pg', '~> 0.17.1'
  gem 'rails_12factor'
end
group :test do
  gem 'cucumber-rails', :require => false
  gem 'capybara'
  gem 'poltergeist'
  gem 'selenium-webdriver'
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
  gem "codeclimate-test-reporter", group: :test, require: nil
end
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

gem 'spring',        group: :development

# image storage and attaching
gem 'cloudinary'
gem 'attachinary'


# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]


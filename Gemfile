source 'https://rubygems.org'
ruby "2.0.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'



# Use Geokit
# gem 'geokit'
# gem 'geokit-rails'

# use geocoder
gem 'geocoder'
gem 'protected_attributes'

# Use SCSS for stylesheets
gem 'jquery-rails'  # If using Bootstrap's JS plugins.
gem 'sass-rails'

gem 'will_paginate', '~> 3.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby


# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

group :production, :deployment do
  gem 'pg'
  gem 'rails_12factor'
end

group :development, :test do
  gem 'capybara', '~> 2.1.0'
  gem 'factory_girl'
  gem 'rspec-rails', '~> 2.14.0'
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3' 
  gem 'guard-rspec', require: false
end

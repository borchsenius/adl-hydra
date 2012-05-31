source 'http://rubygems.org'

gem 'rails', '~>3.2.3'

gem 'blacklight', '~> 3.3.2'
gem 'hydra-head', '~> 4.0.1'

# We will assume that you're using sqlite3 for testing/demo,
# but in a production setup you probably want to use a real sql database like mysql or postgres
gem 'sqlite3'

# We will assume you're using devise in tutorials/documentation.
# You are free to implement your own User/Authentication solution in its place.
gem 'devise'



# Rails uses asset pipeline.  You will need these gems for used your assets in development.
# However, you won't need them in production because they will be precompiled.
group :assets do
  gem 'sass-rails', '~> 3.2.0'
  gem 'compass-rails', '~> 1.0.0'
  gem 'compass-susy-plugin', '~> 0.9.0'
  gem 'jquery-rails'
  # fix for doing rake hyhead:spec
  #gem 'therubyracer'
end

# You will probably want to use these to run the tests you write for your hydra head
# For testing with Cucumber
#
group :cucumber do
  gem 'cucumber'
  gem 'cucumber-rails'
end

# For testing with rspec
group :development, :test do
  gem 'rspec-rails', '>=2.9.0'
  gem 'jettywrapper'
  gem 'database_cleaner'
end

group :test do
  gem 'rspec-rails', '>=2.9.0'
  gem 'cucumber-rails'
  #,"1.3.0", :require => false
  gem 'database_cleaner'
end

gem "devise"
gem "compass-rails", "~> 1.0.0", :group => :assets
gem "compass-susy-plugin", "~> 0.9.0", :group => :assets
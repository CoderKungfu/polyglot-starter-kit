remove_file "README.rdoc"

file 'Procfile', <<-CODE
web: bundle exec puma -C ./config/puma.rb
CODE

file '.env', <<-CODE
RACK_ENV=development
PORT=3000
CODE

file 'config/database-travis.yml', <<-CODE
test:
  adapter: postgresql
  database: travis_ci_test
  username: postgres
CODE

file '.travis.yml', <<-CODE
language: ruby
rvm:
  - 2.4.1
services:
  - postgresql
bundler_args: "--without production --jobs=3"
cache: bundler
before_script:
  - psql -c 'create database travis_ci_test;' -U postgres
  - cp config/database-travis.yml config/database.yml
  - bundle exec rake db:schema:load RAILS_ENV=test
CODE

append_file ".gitignore", ".env"

gem 'slim-rails'

gem_group :development, :test do
  gem 'rspec-rails'
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'better_errors'
  gem 'spring-commands-rspec'
  gem 'dotenv-rails'
end

has_devise = false
if yes? "Do you want to add Devise?"
  has_devise = true
  gem 'devise'
end

run 'bundle install'
generate 'rspec:install'
if has_devise
  generate 'devise:install'
  user_model = ask("What is the name of your Devise User Model")
  generate "devise #{user_model.camelize}"

  file 'spec/support/devise.rb', <<-CODE
RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::ControllerHelpers, type: :view
end
CODE
end

if yes? "Do you want to generate a root controller?"
  name = ask("What should it be called?").underscore
  generate :controller, "#{name} index", "--no-view-specs", "--no-helper-specs", "--no-controller-specs", "--no-javascripts", "--no-stylesheets"
  route "root to: '#{name}\#index'"
end

if yes? "Do you want to create a Git repo?"
  after_bundle do
    git :init
    git add: "."
    git commit: "-a -m 'initial commit'"
  end
end

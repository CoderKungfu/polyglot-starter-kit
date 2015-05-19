remove_file "README.rdoc"
create_file "README.md", "TODO"

file 'config/unicorn.rb', <<-CODE
worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
timeout 15
preload_app true

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
CODE

file 'Procfile', <<-CODE
web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
CODE

file '.env', <<-CODE
RACK_ENV=development
PORT=3000
CODE

append_file ".gitignore", ".env"

gem 'slim-rails'
gem 'unicorn'

gem_group :development, :test do
  gem 'rspec-rails'
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'better_errors'
  gem 'spring-commands-rspec'
end

gem_group :production do
  gem 'rails_12factor'
  # gem 'newrelic_rpm'
end

run 'bundle install'
generate 'rspec:install'

if yes? "Do you want to generate a root controller?"
  name = ask("What should it be called?").underscore
  generate :controller, "#{name} index"
  route "root to: '#{name}\#index'"
end

if yes? "Do you want to create a Git repo?"
  git :init
  git add: "."
  git commit: "-a -m 'initial commit'"
end

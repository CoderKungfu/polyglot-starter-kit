## Getting started with Ruby and Ruby on Rails

Here are the steps you will need to setup your local development environment (macOS) to run Ruby and Rails:

### A. Install Ruby

1. Install [Homebrew](http://brew.sh).

2. Install [rbenv](https://github.com/rbenv/rbenv):

  ```
brew update
brew install rbenv ruby-build
```

3. Add `rbenv` support to your local profile:

  ```
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
```

  If you are using `zsh`:

  ```
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
```

3. Install the current Ruby version:

  ```
rbenv install -l
rbenv install 2.4.1
```

4. Use it globally:

  ```
rbenv global 2.4.1
```

### B. Install PostgreSQL database server

You will need [PostgreSQL](http://www.postgresql.org) installed and started.

> If you are unfamiliar with PostgreSQL, we suggest that you download and install [Postgres Mac App](http://postgresapp.com). You may need to edit `config/database.yml` to [connect via TCP socket](http://postgresapp.com/documentation/configuration-ruby.html).

### C. Install Rails & other Gems

1. Install [Bundler](http://bundler.io/), the Ruby dependency management software:

	```
gem install bundler
```

2. Install [Ruby on Rails](http://rubyonrails.org):

	```
gem install rails
```

	This will install a `rails` command line software that runs in your terminal.

## Starting a new Ruby on Rails project

### A. Create a new `rails` app

```
rails new <project_name>
```

### B. Prepare the Database

1. Create the database:

  ```
bundle exec rake db:create
```

2. Create the database tables:

  ```
bundle exec rake db:migrate
```

3. Prepare sample data:

  ```
bundle exec rake db:seed
```

### C. Start the development web server

1. You can start the local development web server with the following command:

  ```
rails server
```

2. You can now visit the local development site at [http://localhost:3000](http://localhost:3000).

3. To stop the dev server, just press `ctrl` + `c` on your keyboard to stop the foreman process.

## Known Issues

Error when building gem native extensions for `pg` on macOS.

```
Gem::Ext::BuildError: ERROR: Failed to build gem native extension.
    current directory: /Users/pmcc749i/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/pg-0.19.0/ext
/Users/pmcc749i/.rbenv/versions/2.3.1/bin/ruby -r ./siteconf20160929-41926-1ce9xrk.rb extconf.rb
checking for pg_config... no
No pg_config... trying anyway. If building fails, please try again with
 --with-pg-config=/path/to/pg_config
checking for libpq-fe.h... no
Can't find the 'libpq-fe.h header
*** extconf.rb failed ***
Could not create Makefile due to some reason, probably lack of necessary
libraries and/or headers.  Check the mkmf.log file for more details.  You may
need configuration options.
```

**Solution:**

```
gem install pg -v '0.19.0' -- --with-pg-config=/Applications/Postgres.app/Contents/Versions/9.5/bin/pg_config
```

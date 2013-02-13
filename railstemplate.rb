def gems(gems, options = {})
  gems.each { |g| gem g, options }
end

def gems_group(gems, *groups)
  gem_group *groups do
    gems.each { |g| gem g }
  end
end

gems %w(haml thin)

# Gems for developing
#gems %w(heroku heroku_san foreman), group: :development
gems_group %w(heroku heroku_san foreman), :development

# Gems for testing
gems_group %w(faker rspec-rails), :development, :test

gems_group %w(capybara poltergeist webmock factory_girl_rails shoulda-matchers database_cleaner), :development

# Gems for making tests faster
gems_group %w(guard-rspec guard-spork ruby_gntp rb-fsevent), :development, :test

# Gems for testing javascript
gems_group %w(konacha chai-jquery-rails sinon-chai-rails sinon-rails ejs), :development, :test

# Gems for running on heroku
gems_group %w(pg), :production

remove_file 'README.rdoc'
create_file 'README.md', 'TODO'

run 'bundle install > /dev/null'
generate 'rspec:install'

run 'bundle exec guard init'

rake 'db:migrate'

remove_file 'public/index.html'

run 'rm -rf test'
run 'rm -rf doc'

append_file '.gitignore', 'config/database.yml'
run 'cp config/database.yml config/database.yml.example'

initializer 'generators.rb', <<RUBY
  Rails.application.config.generators do |g|
    g.test_framework = :rspec
    g.view_specs false
    g.helper_specs false
    g.routing_specs false
    g.controller_specs false
    g.stylesheets false
    g.javascripts false
  end
RUBY

git :init
git add: '.', commit: '-m "Initial commit"'

# base_template.rb
run "echo TODO > README"

gem "formtastic"
gem 'will_paginate'
gem 'nifty-generators'
rake "gems:install"

if yes?("Do you want to use RSpec?")
  gem "factory_girl"
  gem "rspec"
  gem "rspec-rails"
  generate :rspec
end

generate :nifty_layout

git :init

file ".gitignore", <<-END
.DS_Store
log/*.log
tmp/**/*
config/database.yml
db/*.sqlite3
END

run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"
run "cp config/database.yml config/example_database.yml"

git :add => ".", :commit => "-m 'initial commit'"

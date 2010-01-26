# base_template.rb
run "echo TODO > README"

gem "formtastic", :lib => false
gem 'will_paginate', :lib => false
gem 'nifty-generators', :lib => false
rake "gems:install"

if yes?("Do you want to use RSpec?")
  gem "factory_girl", :lib => false, :version => ">= 1.2.3"
  gem "rspec", :lib => false, :version => ">= 1.3.0"
  gem "rspec-rails", :lib => false, :version => ">= 1.3.2"
  rake "gems:install"
  generate :rspec
  
  run "rm -rf spec/fixtures"
  run "mkdir spec/factories"
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

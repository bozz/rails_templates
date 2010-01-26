# auth_template.rb
load_template "http://github.com/bozz/rails_templates/raw/master/base.rb"

gem "authlogic", :lib => false
rake "gems:install"

# copy lucid_auth generator and run
run "mkdir lib/generators"
run "cp -rf ../rails_generators/lucid_auth lib/generators/"
generate :lucid_auth

rake "db:migrate"
rake "db:test:clone"

git :add => ".", :commit => "-m 'adding authentication'"

generate :controller, "welcome index"
route "map.root :controller => 'welcome'"
git :rm => "public/index.html"

git :add => ".", :commit => "-m 'adding welcome controller'"

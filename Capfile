require "capistrano/setup"

require "capistrano/deploy"

require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

require "capistrano/rails"
requrie "capistrano/passenger"
require "capistrano/rvm"
set :rvm_type, :user
set :rvm_ruby_version, '2.5.1'

Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }

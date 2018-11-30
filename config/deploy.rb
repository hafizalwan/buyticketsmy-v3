lock "~> 3.11.0"

set :application, "buyticketsmy-v3"
set :repo_url, "git@github.com:hafizalwan/buyticketsmy-v3.git"

set :deploy_to, "/home/btodev/buyticketsmy-v3"

append :linked_files, "config/database.yml", "config/master.key"

append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"

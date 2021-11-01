set :application, "playcmd"
set :repo_url, "git@github.com:tjerk-git/play_cmd.git"
set :branch, ENV['BRANCH'] if ENV['BRANCH']

# Deploy to the user's home directory
set :deploy_to, "/home/deploy/#{fetch :application}"

append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads'

# Only keep the last 5 releases to save disk space
set :keep_releases, 5

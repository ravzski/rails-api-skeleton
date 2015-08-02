require 'net/ssh/proxy/command'
require 'airbrake/capistrano3'

# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'scm'
set :repo_url, 'git@bitbucket.org:ravbay/scm.git'
set :deploy_to, '/home/deploy/apps/scm'
set :format, :pretty
set :log_level, :debug
set :linked_files, %w{config/database.yml config/secrets.yml config/skylight.yml config/redis.yml config/aws.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system config/thin}

set :assets_roles, [:app]

namespace :deploy do
  after :publishing, :restart
end

after "deploy:finished", "airbrake:deploy"

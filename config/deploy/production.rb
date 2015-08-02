server '<IP HERE>', user: 'deploy', roles: %w{web app db}
set :stage, :production
set :branch, 'master'
set :keep_releases, 5
set :rails_env, 'production'

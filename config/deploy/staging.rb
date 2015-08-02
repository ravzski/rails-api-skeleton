server '<IP HERE>', user: 'deploy', roles: %w{web app db}
set :stage, :production
set :branch, 'staging'
set :keep_releases, 5
set :rails_env, 'production'

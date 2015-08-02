Rails.application.routes.draw do

  namespace :api, defaults: { format: 'json' } do
    scope module: :v1 do
      resource :session, only: %i(show create destroy)
      resource :users
    end
  end

end

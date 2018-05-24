Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    resources :users, only: %i[new create] do
      resources :orders, only: %i[index new create edit update show]
    end
    resource :session, only: %i[new create destroy]

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

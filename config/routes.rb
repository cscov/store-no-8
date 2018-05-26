Rails.application.routes.draw do

    resources :users, only: %i[new create] do
      resources :orders
    end
    resource :session, only: %i[new create destroy]
    resources :items, only: %i[index show]
  end

  root to: 'static_pages#root'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

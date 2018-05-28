Rails.application.routes.draw do

    resources :users, only: %i[new create] do
      resources :orders, except: %i[new update]
    end
    resource :session, only: %i[new create destroy]
    resources :items, only: %i[index show]
    resources :order_items, only: %i[create destroy]

    root to: 'static_pages#root'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

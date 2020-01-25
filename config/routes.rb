Rails.application.routes.draw do
  root :to => "novelties_producer#index"
  get 'novelties_producers/', to: "novelties_producer#index"
  get 'novelties_producers/:id', to: "novelties_producer#show", as: "novelties_producer"
  devise_for :users
  scope 'admin', as: 'admin' do
    resources :users, except: [:new, :create, :destroy]
  end
  resources :products
  resources :varieties
  resources :novelties
  resources :type_problems
  resources :species
  resources :farms do
    resources :plots do
      resources :crops
      resources :problems
      resources :plantations
      resources :product_applications
    end
  end
  get '/farms/:farm_id/new_users', to: "user_farm_roles#new_users", as: "farm_new_user"
  post '/farms/:farm_id/add_users', to: "user_farm_roles#add_users", as: "farm_add_user"
  post '/farms/:farm_id/destroy_users', to: "user_farm_roles#destroy", as: "farm_destroy_user"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  get 'novelties_producers/', to: "novelties_producer#index"
  get 'novelties_producers/:id', to: "novelties_producer#show", as: "novelties_producer"
  devise_for :users
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

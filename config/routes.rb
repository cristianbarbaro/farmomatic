Rails.application.routes.draw do
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

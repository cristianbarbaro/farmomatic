Rails.application.routes.draw do
  resources :crops
  resources :product_applications
  resources :problems
  resources :plantations
  resources :products
  resources :varieties
  resources :type_problems
  resources :species
  resources :plots
  resources :farms
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

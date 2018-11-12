Rails.application.routes.draw do
  resources :orders
  resources :categories
  resources :products
  
  get 'search', to: 'products#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

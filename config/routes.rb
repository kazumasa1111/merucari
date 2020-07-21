Rails.application.routes.draw do

  root 'items#index'
  get 'test_products/show'
  resources :items
end

Rails.application.routes.draw do

  root 'products#index'
  get 'test_products/show'
  resources :products
end

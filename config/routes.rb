Rails.application.routes.draw do

  devise_for :users
  devise_scope :user do
    get  'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root 'items#index'
  get 'test_products/show'
end

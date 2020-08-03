Rails.application.routes.draw do 
  
  get 'contracts/new'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root 'items#index'
  get 'test_products/show'
  get 'test_products/create'

  resources :items
  resources :users, only: :show 
  # マイページ用に作成ビューは適当です。
  resources :cards, only: [:new, :create, :index, :destroy]
  # クレジット用のコントローラーです
  # resources :products do
  #   resources :contracts, only: [:new, :create]
  # end
  resources :contracts, only: [:new, :create]
end

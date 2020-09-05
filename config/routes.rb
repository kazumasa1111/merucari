Rails.application.routes.draw do


  # get 'contracts/new'
  # get 'cards/index'
  # get 'cards/new'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  root 'products#index'
  get 'test_products/create'

  resources :products do
    collection do
      get :search
    end
    resources :contracts, only: [:new, :create, :edit, :update, :destroy]
  end


  resources :categories, only: [:show]


  resources :users, only: :show
  resources :cards, only: [:new, :create, :index, :destroy]
  # クレジット用のコントローラーです
  # resources :products do
  #   resources :contracts, only: [:new, :create]
  # end
  # resources :contracts, only: [:new, :create]
end


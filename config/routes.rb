Rails.application.routes.draw do

  root 'products#index'
  get 'test_products/show'
  resources :products do
    collection do
      get :search
    end
  end
end

Rails.application.routes.draw do

  root 'items#index'
  get 'users/index'
end

Rails.application.routes.draw do
  
  resources :coctels
  resources :liquors
  resources :usuarios
  devise_for :userlogs
  #get 'home/index'
  get 'home/index'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

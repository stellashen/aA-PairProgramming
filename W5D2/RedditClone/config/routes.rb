Rails.application.routes.draw do

  resources :users do
    resources :posts, only: [:edit, :update]
  end
  resource :session, only: [:new, :create, :destroy]
  resources :subs do
    resources :posts, only: [:new, :create]
  end
  resources :posts, only: [:show, :destroy] do
    resources :comments, only: :new
  end 
  resources :comments, only: :create
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

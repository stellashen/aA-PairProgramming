Rails.application.routes.draw do

  resources :users do
    resources :posts, only: [:edit, :update]
  end 
  resource :session, only: [:new, :create, :destroy]
  resources :subs
  resources :posts, only: [:new, :create, :show, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

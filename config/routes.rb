Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[show, index] do
    member do
     get :following, :followers
    end
  end
  resources :relationships,only: [:create, :destroy]
  
  root 'pages#index'
  resources :posts
 # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

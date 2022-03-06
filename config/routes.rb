Rails.application.routes.draw do
  devise_for :users
  # プロフィール関連
  get "users/show" => "users#show"

  # フォロー関連
  resources :users do
    member do
     get :following, :followers
    end
  end
  
  resources :relationships,only: [:create, :destroy]
  
  root 'pages#index'
  resources :posts
end

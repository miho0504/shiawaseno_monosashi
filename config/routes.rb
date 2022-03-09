Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  
  resources :posts
  # プロフィール関連
  get "users/show" => "users#show"

  # フォロー関連
  resources :users do
    member do
  
     resources :followers
     get :following, :followers
     get :search
     
    end
  end

  resources :relationships,only: [:create, :destroy]

end

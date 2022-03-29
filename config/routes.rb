Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  
  resources :posts
  # フォロー関連
  resources :users do
    collection do
      get :friend_list
    end
    member do
     resources :followers
     get :following, :followers
     get :search
    end
  end
    # プロフィール関連
  get "users/show" => "users#show"
  resources :relationships,only: [:create, :destroy]

end

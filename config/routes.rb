Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  
  # ゲストログイン
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  get "users/show" => "users#show"
  root 'pages#index'
  

  resources :posts
  resources :users

  resources :relationships,only: [:create, :destroy]
  resources :graphs
end

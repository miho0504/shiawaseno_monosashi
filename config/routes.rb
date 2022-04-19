Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  get "users/show" => "users#show"
  root 'pages#index'

  resources :posts
  resources :users

  resources :relationships,only: [:create, :destroy]
  resources :graphs
end

Rails.application.routes.draw do
  devise_for :users
  get "users/show" => "users#show"
  
  root 'pages#index'
  resources :posts
 # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[show] do
    resources :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  root 'pages#index'
  resources :posts
 # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

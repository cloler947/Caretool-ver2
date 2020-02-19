Rails.application.routes.draw do
  root 'home#about'
  get 'home/top'
  devise_for :users

  resources :users, only: [:show,:edit,:update,:withdraw, :destroy] do
    get :withdraw, on: :member
    resource :relationships, only: [:create,:destroy]
    get 'follows' => 'relationships#follower'
    get 'followers' => 'relationships#followed'
  end
  resources :posts do
    resource :favorites, only: [:index,:create,:destroy]
    resource :post_comments, only: [:create,:destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

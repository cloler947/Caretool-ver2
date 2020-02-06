Rails.application.routes.draw do
  root 'home#about'
  get 'home/top'
  get 'users/withdraw'
  devise_for :users

  resources :users, only: [:show,:edit,:update,:withdraw] do
    resource :relationships, only: [:create,:destroy]
    get 'follows' => 'relationships#follower'
    get 'followers' => 'relationshps#followed'
  end
  resources :posts do
    resource :favorite, only: [:index,:create,:destroy]
    resource :post_comments, only: [:create,:destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

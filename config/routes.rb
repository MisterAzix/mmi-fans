Rails.application.routes.draw do
  get 'user/show'
  
  resources :posts do
    resources :likes
    resources :comments
  end

  devise_for :users
  resources :users, only: [:show], param: :slug
  
  root 'posts#index'
end

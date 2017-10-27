Rails.application.routes.draw do

  # Control for current user to leave a chatroom
  #only allowed to join and leave a chatroom


  resources :conversations do
    resources :pmessages
  end

  devise_for :users
  resources :groupchats
  resources :admins
  resources :groups
  resources :comments
  resources :posts
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'posts#index'
end

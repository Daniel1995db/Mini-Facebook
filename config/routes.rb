Rails.application.routes.draw do

  # Control for current user to leave a chatroom
  #only allowed to join and leave a chatroom


  resources :chatrooms do
  	resource :chatroom_users
  	resources :messages
  end

  devise_for :users
  resources :groupchats
  resources :admins
  resources :groups
  resources :comments
  resources :posts
  resources :users do
  	resources :friendships, only: [:index, :show, :create, :destroy]
  end
  # get 'friendships' => 'friendships#index'
  # get 'friendships/:id' => 'friendships#show', as: :friendship
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'posts#index'
end

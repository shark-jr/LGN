Rails.application.routes.draw do


  resources :events

  resources :locations


  root 'home#home'
  devise_for :users
  resources :users
  get 'locations/new' => 'locations#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'users/:id' => 'users#show'
  get 'users/index'
  get 'users/:id/edit' => 'users#edit'

  # messaging
  get 'rooms/show'
  # get '/rooms/show' => 'rooms#show', as: '/chats'


  # TODO: route  chat by id like below
  # get '/rooms/:id' => 'rooms#show', as: 'chats'
  mount ActionCable.server => '/cable'
end

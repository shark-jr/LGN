Rails.application.routes.draw do


  # get 'games/show'
  get 'games' => 'games#show'

  resources :events

  resources :locations

  post 'events/:id' => 'events#going'

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
  get 'chat' => 'rooms#show'


  # TODO: route  chat by id like below
  # get '/rooms/:id' => 'rooms#show'
  mount ActionCable.server => '/cable'
end

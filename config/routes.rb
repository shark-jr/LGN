Rails.application.routes.draw do
  resources :locations
  root 'users#index'
  devise_for :users
  resources :users
  get 'locations/new' => 'locations#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'users/:id' => 'users#show'
  get 'users/index'
  get 'users/:id/edit' => 'users#edit'
end

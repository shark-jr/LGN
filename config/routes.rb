Rails.application.routes.draw do
  resources :locations
  root 'pages#home'
  devise_for :users
  get 'locations/new' => 'locations#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

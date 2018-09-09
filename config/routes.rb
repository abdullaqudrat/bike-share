Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'dashboard#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show]
  resources :stations, only: [:index]
  resources :trips, only: [:index, :show]
  resources :conditions, only: [:index, :show]

  get '/:id', to: 'stations#show'
end

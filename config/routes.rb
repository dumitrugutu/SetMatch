Rails.application.routes.draw do
  root 'sessions#welcome'

  get '/login' => 'sessions#new', as: 'new_session'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  # get '/find' => 'posts#find', as: 'find'

  resources :users
  resources :posts
end

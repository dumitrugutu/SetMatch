Rails.application.routes.draw do
  root 'posts#index'

  get '/login' => 'sessions#new', as: 'new_session'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users
  resources :posts
end

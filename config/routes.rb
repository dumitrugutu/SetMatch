Rails.application.routes.draw do
  root 'posts#index'

  get '/login' => 'sessions#new', as: 'new_session'
  post '/login' => 'sessions#create'
  delete '/logout', => 'sessions#destroy'

  resources :users
  resources :posts
end

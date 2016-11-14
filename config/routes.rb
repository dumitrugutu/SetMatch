Rails.application.routes.draw do
  root 'posts#index'
  
  get "/sessions/new" => "sessions#new", as: "new_session"

  resources :users
  resources :posts
end

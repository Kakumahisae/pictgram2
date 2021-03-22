Rails.application.routes.draw do
  

  get 'comments/new'
  root  'pages#index'
  get  'pages/help'
  
  # ログインページへ
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  get 'favorites/index'
  post "/favorites" => "favorites#create"
  delete '/favorites', to: 'favorites#destroy'
  
  resources :users
  resources :topics
  resources :comments
  
  
end

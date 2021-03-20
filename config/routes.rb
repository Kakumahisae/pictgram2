Rails.application.routes.draw do
  
  root  'pages#index'
  get  'pages/help'
  
  # ログインページへ
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  
  resources :users
end

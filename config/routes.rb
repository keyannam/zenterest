Rails.application.routes.draw do

  root 'pages#index'

  get 'zens' => 'zens#new', as: :new_zen
  post '/zens' => 'zens#create', as: :zens
  get 'zens/:id' => 'zens#show', as: :zen
  delete 'zens/:id' => 'zens#destroy', as: :delete_zen

  get 'dashboard' => 'zens#dashboard', as: :dashboard

  get '/sign_up' => 'users#new', as: :sign_up
  post '/users' => 'users#create', as: :users
  get '/users/:id' => 'users#show', as: :user
  delete '/users/:id' => 'users#destroy', as: :delete_user

  get '/sign_in' => 'session#new', as: :sign_in
  post 'auth' => 'session#create', as: :auth
  delete 'sign_out' => 'session#destroy', as: :sign_out

end

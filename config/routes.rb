Rails.application.routes.draw do

  get '/sign_in' => 'session#new', as: :sign_in
  post '/auth' => 'session#create', as: :auth
  get '/sign_out' => 'session#destroy', as: :sign_out

  get '/users/:id' => 'users#show', as: :user
  get '/sign_up' => 'users#new', as: :sign_up
  post '/users' => 'users#create', as: :users
  delete '/users/:id' => 'users#destroy', as: :delete_user
end

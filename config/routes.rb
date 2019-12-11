Rails.application.routes.draw do
  root 'static_pages#home'
  get '/join', to: 'users#new'
  post '/join', to: 'users#create'
  resources 'users'
end

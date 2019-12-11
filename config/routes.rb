Rails.application.routes.draw do
  root 'static_pages#home'
  get '/join', to: 'users#new'
  resources 'users'
end

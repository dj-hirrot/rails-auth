Rails.application.routes.draw do
  root 'static_pages#home'
  get 'join' => 'users#new'
  resources 'users'
end

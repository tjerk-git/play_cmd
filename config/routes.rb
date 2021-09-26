Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"


  get '/profile/:id', to: 'profile#show'
  get '/profile/:id/edit', to: 'profile#edit', :as => :user
  
  patch '/profile/:id/edit', to: 'profile#update'
  put '/profile/:id/edit', to: 'profile#update'

  resources :posts
end

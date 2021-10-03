Rails.application.routes.draw do
  devise_for :users

  root to: "posts#index"

  get '/profile/:id', to: 'profile#show'
  get '/profile/:id/edit', to: 'profile#edit', :as => :user

  get '/post/:id/gallery', to: 'posts#gallery', :as => :gallery_view
  get '/posts/list/:tag', to: 'posts#by_tag', :as => :tag_path
  
  patch '/profile/:id/edit', to: 'profile#update'
  put '/profile/:id/edit', to: 'profile#update'

  resources :posts
end

Rails.application.routes.draw do

  devise_for :users

  root to: "posts#index"

  get '/profile/:id', to: 'profile#show'
  get '/profile/:id/edit', to: 'profile#edit', :as => :user

  get '/post/:id/gallery', to: 'posts#gallery', :as => :gallery_view
  get '/posts/list/:tag', to: 'posts#by_tag', :as => :tag_path
  post '/posts/list/filter/', to: 'posts#filter', :as => :filter_path
  
  patch '/profile/:id/edit', to: 'profile#update'
  put '/profile/:id/edit', to: 'profile#update'

  put '/post/:id/like', to: 'posts#like', as: 'like'

  post '/comment/new/:post_id', to: 'comments#create', :as => :new_comment

  resources :posts, param: :slug

end

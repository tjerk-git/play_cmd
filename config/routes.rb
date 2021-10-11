Rails.application.routes.draw do
  root to: "posts#index"

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :posts, param: :slug

  get '/post/:id/gallery', to: 'posts#gallery', :as => :gallery_view
  get '/posts/list/for-you', to: 'posts#for_you', :as => :for_you
  get '/posts/list/:slug', to: 'posts#by_tag', :as => :tag_path


  post '/posts/list/filter/', to: 'posts#filter', :as => :filter_posts
  put '/post/:id/like', to: 'posts#like', :as =>'like'

  get '/people/list/', to: 'profile#list', :as => :people
  get '/people/search/', to: 'profile#list', :as => :filter_people
  get '/people/list/:slug', to: 'profile#by_tag', :as => :tag_users

  get '/profile/:slug', to: 'profile#show', :as => :profile

  post '/comment/new/:post_id', to: 'comments#create', :as => :new_comment

end

Rails.application.routes.draw do

  devise_for :users, skip: [ :sessions, :passwords, :registrations ]
  as :user do
    get 'login', to: 'users/sessions#new', as: :new_user_session
    post 'login', to: 'users/sessions#create', as: :user_session
    match 'logout', to: 'users/sessions#destroy', as: :destroy_user_session, via: Devise.mappings[:user].sign_out_via
  end

  root to: "posts#index"

  get '/profile/:id', to: 'profile#show'
  get '/profile/:id/edit', to: 'profile#edit', :as => :user

  get '/post/:id/gallery', to: 'posts#gallery', :as => :gallery_view
<<<<<<< HEAD
#   get '/posts/:tag', to: 'posts#index', :as => :tag_path

=======
  get '/posts/list/:tag', to: 'posts#by_tag', :as => :tag_path
  post '/posts/list/filter/', to: 'posts#filter', :as => :filter_path
  
>>>>>>> cedf11736d3a7c62427ebed59233146011d989c8
  patch '/profile/:id/edit', to: 'profile#update'
  put '/profile/:id/edit', to: 'profile#update'

  resources :posts, param: :slug

end

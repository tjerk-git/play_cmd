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
#   get '/posts/:tag', to: 'posts#index', :as => :tag_path

  patch '/profile/:id/edit', to: 'profile#update'
  put '/profile/:id/edit', to: 'profile#update'

  resources :posts
end

Rails.application.routes.draw do
  root to: "posts#index"

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :posts, param: :slug
  resources :mentions, only: [:index]

  get '/tag/:slug', to: 'tag#show', :as => 'tag'
  get '/tag/:slug/members', to: 'tag#members', :as => 'tag_members'
  get '/tag/:slug/highlighted', to: 'tag#highlighted', :as => 'tag_highlighted'

  namespace :admin do
    resources :tags
  end

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

  get '/post/:slug/public', to: 'posts#public', :as => :public_post
  get '/posts/list/for-you', to: 'posts#for_you', :as => :for_you
  get '/posts/list/:slug', to: 'posts#by_tag', :as => :tag_path

  patch '/posts', to: 'posts#update', :as => :update_posts
  post '/posts/list/filter/', to: 'posts#filter', :as => :filter_posts
  put '/post/:id/like', to: 'posts#like', :as =>'like'

  get '/posts/:slug/highlight_show', to: 'posts#highlight_modal', :as => 'highlight_modal'

  get '/people/list/', to: 'profile#list', :as => :people
  get '/people/search/', to: 'profile#list', :as => :filter_people
  get '/people/list/:slug', to: 'profile#by_tag', :as => :tag_users

  get '/profile/show/:slug', to: 'profile#show', :as => :profile
  get '/profile/likes/list', to: 'profile#likes_list', :as => :profile_likes
  get '/profile/posts/list', to: 'profile#posts_list', :as => :profile_posts
  get '/profile/edit/:slug', to: 'profile#edit', :as => :profile_edit
  put '/profile/hide_onboarding', to: 'profile#hide_onboarding', :as => :hide_onboarding

  post '/comment/new/:post_id', to: 'comments#create', :as => :new_comment
  put '/comment/:id/upvote', to: 'comments#upvote_comment', :as => 'upvote'
  delete '/comment/:id', :to => 'comments#destroy', :as => :delete_comment
  post '/highlight/new/:post_id', to: 'highlights#create', :as => :new_highlight

  namespace :api, defaults: { format: "json" } do
    scope module: :v0 do
      resources :posts, only: [:index]
    end
  end
end

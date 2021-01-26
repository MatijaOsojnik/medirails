Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :articles 

  # mount Commontator::Engine => '/commontator'


  #BOOKMARKS
  put '/article/:id/bookmark', to: 'articles#bookmark', as: 'bookmark'
  delete '/article/:id/bookmark', to: 'articles#delete_bookmark', as: 'remove_bookmark'
  get '/users/bookmarks', to: 'articles#find_bookmarks', as: 'bookmarks'

  #LIKES
  put '/article/:id/likes', to: 'articles#like', as: 'like'
  delete '/article/:id/likes', to: 'articles#delete_like', as: 'remove_like'
  get '/users/likes', to: 'articles#find_likes', as: 'likes'

  #FOLLOWS
  post '/users/:id/follow', to: "users#follow", as: "follow"
  post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow"
  get '/users/:id/followers', to: "users#followers", as: "follower"
  get '/users/:id/following', to: "users#followees", as: "followee"
  # post '/articles/:id/follow', to: "users#follow_by_article", as: "follow_by_article"
  # delete '/articles/:id/unfollow', to: "users#unfollow_by_article", as: "unfollow_by_article"
  get '/users/following', to: 'users#following', as: 'following'
  get '/users/followers', to: 'users#followers', as: 'followers'

  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks', :registrations => 'users/registrations' }
  resources :users, :only => [:show]
  
  root to: "articles#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

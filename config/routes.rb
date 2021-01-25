Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :articles 

  #BOOKMARKS
  put '/article/:id/bookmark', to: 'articles#bookmark', as: 'bookmark'
  delete '/article/:id/bookmark', to: 'articles#delete_bookmark', as: 'remove_bookmark'
  get '/users/bookmarks', to: 'articles#find_bookmarks', as: 'bookmarks'

  #LIKES
  put '/article/:id/likes', to: 'articles#like', as: 'like'
  delete '/article/:id/likes', to: 'articles#delete_like', as: 'remove_like'
  get '/users/likes', to: 'articles#find_likes', as: 'likes'

  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks', :registrations => 'users/registrations' }
  resources :users, :only => [:show]
  
  root to: "articles#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

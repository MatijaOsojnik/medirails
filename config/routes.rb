Rails.application.routes.draw do
  resources :articles 
  put '/article/:id/bookmark', to: 'articles#bookmark', as: 'bookmark'
  get '/users/bookmarks', to: 'articles#find_bookmarks', as: 'bookmarks'
  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' }

  root to: "articles#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

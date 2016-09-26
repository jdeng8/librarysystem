Rails.application.routes.draw do

  get 'pages/home', to: 'page#home' , as: 'page_home'

  get 'pages/page1'

  get 'pages/page2'

  get '/user/list', to: 'users#list' , as:'user_list'
  get '/user/:id/change(.:format)', to: 'users#change',as: 'user_change'
  get '/user/new' , to: 'users#new' , as:'user_admin_new'

  get "rooms/search", to: "rooms#search"


  devise_for :users,:path => 'u'

  resources :nothings
  resources :users
  resources :rooms
  resources :pages
  resources :appoints


  #get '/user/:id(.:format)', to: 'users#show'
  #patch '/user/:id/(.:format)', to: 'users#update'
  #put '/user/:id/(.:format)', to: 'users#update'
  #delete '/user/:id/destroy(.:format)', to: 'users#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#home'
end

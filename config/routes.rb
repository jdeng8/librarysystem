Rails.application.routes.draw do

  get 'pages/home', to: 'page#home' , as: 'page_home'

  get '/user/list', to: 'users#list' #, as:'user_list'
  get '/user/:id/change(.:format)', to: 'users#change',as: 'user_change'
  get '/user/new' , to: 'users#new' , as:'user_admin_new'


  get "rooms/search", to: "rooms#search", as: 'rooms_search'
  get "rooms/result", to: "rooms#result", as: 'rooms_search_result'

  get "rooms/:id/view", to: "rooms#view" , as: "room_view"

  devise_for :users,:path => 'u'

  resources :users do
    resources :appoints
  end

  resources :rooms do
    resources :appoints
  end

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

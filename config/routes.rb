Rails.application.routes.draw do
  root to: 'homepages#index'

  resources :works
  resources :users
  # get '/users', to: 'users#index', as: 'users'

  get '/login', to: 'users#login_form', as: 'login'
  post '/login', to: 'users#login'
  post '/logout', to: 'users#logout', as: 'logout'
  # get '/users/current', to: 'users#current', as: 'current_user'
  # get '/users/:id', to: 'users#show', as: 'user'

  post '/upvote/:id', to: 'users#upvote', as: 'upvote'

end

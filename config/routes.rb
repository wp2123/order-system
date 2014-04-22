OrderSystem::Application.routes.draw do

  root to: 'session#new'
  get '/signin', to: 'session#new', as: 'signin'
  get '/signout', to: 'session#destroy'
  post 'session', to: 'session#create'

  get '/admin', to: 'user#admin_page', as: 'admin'

  get '/user', to: 'user#new_user', as: 'new_user'
  post 'user', to: 'user#create_user'
  get '/customer', to: 'user#new_customer', as: 'new_customer'

end

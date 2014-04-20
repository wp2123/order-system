OrderSystem::Application.routes.draw do

  root to: 'session#new'
  get '/signin', to: 'session#new', as: 'signin'
  get '/signout', to: 'session#new'
  post 'session', to: 'session#create'

  get '/admin', to: 'user#admin_page', as: 'admin'

end

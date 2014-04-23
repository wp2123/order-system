OrderSystem::Application.routes.draw do

  root to: 'session#new'
  get '/signin', to: 'session#new', as: 'signin'
  get '/signout', to: 'session#destroy'
  post 'session', to: 'session#create'

  get '/admin', to: 'user#admin_page', as: 'admin'
  get 'user/index', to: 'user#user_index', as: 'users'
  get 'customer/index', to: 'user#customer_index', as: 'customers'

  scope '/user' do
    get '/', to: 'user#new_user', as: 'new_user'
    post '/', to: 'user#create_user'
    get '/customers', to: 'user#show_customers'
    post '/customer', to: 'user#user_create_customer'
  end

  scope '/customer' do
    get '/', to: 'user#new_customer', as: 'new_customer'
    post '/', to: 'user#create_customer'
  end

end

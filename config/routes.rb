Rails.application.routes.draw do
  devise_for :my_logins, controllers: {
    registrations: 'registrations',
    sessions: 'sessions',
    omniauth_callbacks: 'my_logins/omniauth_callbacks'
  }

  # devise_for :users #, :controllers => { :registrations => 'users/registrations', :confirmations => 'users/confirmations' }
  # devise_scope :user do
  #   get 'signup', to: 'devise/registrations#new'
  #   get 'login', to: 'devise/sessions#new', as: :login
  #   delete 'logout', to: 'devise/sessions#destroy', as: :logout
  # end

  devise_for :admin_user, path: 'auth', controllers: {
    omniauth_callbacks: 'admin/omniauth_callbacks'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'categories#index'

  resources :categories
  resources :products

  get 'users/login', to: 'users#login'
  post 'users/login', to: 'users#login', as: :user_login
  get 'index', to: 'application#index'

  mount API::Root => '/'
  unless Rails.env.production?
    mount GrapeSwaggerRails::Engine, at: '/swagger'
  end
end

Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => 'users/registrations', :confirmations => 'users/confirmations' }
  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
    get 'signin', to: 'devise/sessions#new'
    delete 'signout', to: 'devise/sessions#destroy'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "categories#index"

  resources :categories
  resources :products

  get 'index', to: 'application#index'
  get 'copy', to: 'application#copy'

  resources :es6
  resources :cloudinary

  mount API::Root => '/'
  unless Rails.env.production?
    mount GrapeSwaggerRails::Engine, at: '/swagger'
  end
end

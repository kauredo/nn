Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  root to: 'pages#work'
  get '/work', to: 'pages#work'
  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'
  get '/backoffice', to: 'backoffice#index'
  resources :photos, only: [:destroy]
  namespace :backoffice do
    resources :pages do
      patch 'photos'
      delete 'delete_photo'
    end
  end
  get '*slug', to: 'pages#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

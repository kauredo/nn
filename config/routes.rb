Rails.application.routes.draw do
  devise_for :admins
  root to: 'pages#work'
  get '/work', to: 'pages#work'
  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'
  get '/backoffice', to: 'backoffice#index'
  namespace :backoffice do
    resources :pages
  end
  get '*slug', to: 'pages#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
